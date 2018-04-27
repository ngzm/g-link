module Rp
  # Authenticate and Authorize with Twitter
  # Twitter is implemented with using Oauth 1.0
  class TwitterController < RpController
    before_action :rp
    before_action :check_create_param, only: :create
    before_action :check_show_param, :check_show_session, only: :show
    after_action :register_create_session, only: :create
    after_action :register_show_session, only: :show

    PROVIDER = 'twitter'.freeze

    def create
      @rp.obtain_request_token

      register_auth_token

      redirect_to @rp.authorization_endpoint_uri
    end

    def show
      initialize_provider_for_show

      @rp.obtain_access_token

      @rp.obtain_user_profile

      id_token

      update_auth_token

      register_user

      redirect_to @auth_token.redirect_uri
    end

    private

    def rp
      super PROVIDER
    end

    def register_auth_token
      # Note!!!
      # use column of "provider_id_token" as a "request_token_secret"
      data = {
        client_token: @client_token,
        redirect_uri: @redirect_uri,
        provider_id_token: @rp.request_token_secret,
        provider: PROVIDER
      }
      logger.debug "------- auth_token_data = #{data}"
      @auth_token = super(data)
    end

    def register_create_session
      session[:auth_token_id] = @auth_token.id
    end

    def check_show_param
      @oauth_token = params[:oauth_token]
      @oauth_verifier = params[:oauth_verifier]
      @denied = params[:denied]
      raise Auths::Error::Unauthorized, 'Denied authorization' \
        unless @denied.nil?
      raise Auths::Error::Unauthorized, 'Missing parameter oauth_token' \
        if @oauth_token.nil?
      raise Auths::Error::Unauthorized, 'Missing parameter oauth_verifier' \
        if @oauth_verifier.nil?
    end

    def check_show_session
      id = session[:auth_token_id]
      raise Auths::Error::Unauthorized, 'Missing session auth_token_id' \
        if id.nil?

      begin
        auth_token = AuthToken.find(id)
      rescue ActiveRecord::RecordNotFound => e
        raise Auths::Error::Unauthorized, "Missing AuthToken id = #{id} : #{e}"
      end

      @client_token = auth_token.client_token
      @request_token_secret = auth_token.provider_id_token
    end

    def initialize_provider_for_show
      @rp.oauth_token = @oauth_token
      @rp.oauth_verifier = @oauth_verifier
      @rp.request_token_secret = @request_token_secret
    end

    def register_show_session
      # It's for admin menu, look up id_token when it is admin menu.
      session[:id_token] = @id_token if @user.admin

      # delete session
      session[:auth_token_id] = nil
    end

    def id_token
      @identifer = "#{@rp.user_id}@#{PROVIDER}"
      @id_token = super(@identifer)
    end

    def update_auth_token
      data = {
        client_token: @client_token,
        id_token: @id_token,
        provider_access_token: @rp.access_token,
        provider_id_token: @rp.access_token_secret
      }
      logger.debug "------- auth_token_data = #{data}"
      @auth_token = super(data)
    end

    def register_user
      user_data = {
        provider: PROVIDER,
        identifer: @identifer,
        name: @rp.user_profile['screen_name'],
        full_name: @rp.user_profile['name'],
        picture: @rp.user_profile['profile_image_url_https']
      }
      logger.debug "-------- user_data = #{user_data}"
      @user = super user_data
    end
  end
end
