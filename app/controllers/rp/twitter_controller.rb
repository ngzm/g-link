module Rp
  # Authenticate and Authorize with Twitter
  # Twitter is implemented with using Oauth 1.0
  class TwitterController < RpController
    before_action :provider
    before_action :check_show_param, :check_show_session, only: :show
    before_action :initialize_provider_for_show, only: :show
    after_action :register_create_session, only: :create
    after_action :register_show_session, only: :show
    skip_before_action :check_create_param, except: :create

    PROVIDER = 'twitter'.freeze

    def create
      # register initial auth data to auth_tokens table
      register_auth_token

      # STEP1 request token
      @provider.obtain_request_token

      # STEP2 authenticate token
      redirect_to @provider.authorization_endpoint_uri
    end

    def show
      # STEP3 access token
      @provider.obtain_access_token

      # STEP4 user profile data
      @provider.obtain_user_profile

      # generate id_token
      id_token

      # update auth_tokens table
      update_auth_token

      # register user data to users table
      register_user

      redirect_to @auth_token.redirect_uri
    end

    private

    def provider
      super PROVIDER
    end

    def register_create_session
      session[:client_token] = @client_token
      session[:request_token_secret] = @provider.request_token_secret
    end

    def check_show_param
      @oauth_token = params[:oauth_token]
      @oauth_verifier = params[:oauth_verifier]
      @denied = params[:denied]
      raise 'Denied authorization' unless @denied.nil?
      raise 'Missing parameter oauth_token' if @oauth_token.nil?
      raise 'Missing parameter oauth_verifier' if @oauth_verifier.nil?
    end

    def check_show_session
      @client_token = session[:client_token]
      @request_token_secret = session[:request_token_secret]
      raise 'Missing session client_token' if @client_token.nil?
      raise 'Missing session request_token_secret' if @request_token_secret.nil?
    end

    def initialize_provider_for_show
      @provider.oauth_token = @oauth_token
      @provider.oauth_verifier = @oauth_verifier
      @provider.request_token_secret = @request_token_secret
    end

    def register_show_session
      # It's for admin menu, look up id_token when it is admin menu.
      session[:id_token] = @id_token if @user.admin

      # delete session
      session[:client_token] = nil
      session[:request_token_secret] = nil
    end

    def id_token
      @identifer = "#{@provider.user_id}@#{PROVIDER}"
      @id_token = super(@identifer)
    end

    def register_auth_token
      super PROVIDER
    end

    def update_auth_token
      data = {
        id_token: @id_token,
        provider_access_token: @provider.access_token,
        provider_id_token: @provider.access_token_secret
      }
      logger.debug "------- auth_token_data = #{data}"
      @auth_token = super(data)
    end

    def register_user
      user_data = {
        name: @provider.user_profile['screen_name'],
        full_name: @provider.user_profile['name'],
        picture: @provider.user_profile['profile_image_url_https'],
        identifer: @identifer
      }
      logger.debug "-------- user_data = #{user_data}"
      @user = super user_data
    end
  end
end
