module Rp
  # Authenticate and Authorize by facebook endpoint
  class FacebookController < RpController
    before_action :rp
    before_action :check_show_param, only: :show
    after_action :register_show_session, only: :show
    skip_before_action :check_create_param, except: :create

    PROVIDER = 'facebook'.freeze

    def create
      initialize_provider_for_create

      register_auth_token

      redirect_to @rp.authorization_endpoint_uri
    end

    def show
      initialize_provider_for_show

      confirm_state(@state)

      @rp.obtain_access_token

      @rp.debug_access_token

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

    def initialize_provider_for_create
      @rp.state = client_token_to_state
    end

    def register_auth_token
      data = {
        client_token: @client_token,
        redirect_uri: @redirect_uri,
        provider: PROVIDER
      }
      logger.debug "------- auth_token_data = #{data}"
      @auth_token = super(data)
    end

    def check_show_param
      @state = params[:state]
      @code = params[:code]
      raise Auths::Error::Unauthorized, 'Missing parameter state' if @state.nil?
      raise Auths::Error::Unauthorized, 'Missing parameter code' if @code.nil?
    end

    def initialize_provider_for_show
      @rp.code = @code
    end

    def register_show_session
      # It's for admin menu, look up id_token when it is admin menu.
      session[:id_token] = @id_token if @user.admin
    end

    def id_token
      @identifer = "#{@rp.user_id}@#{PROVIDER}"
      @id_token = super(@identifer)
    end

    def update_auth_token
      data = {
        client_token: @client_token,
        id_token: @id_token,
        provider_access_token: @rp.access_token
      }
      logger.debug "------- auth_token_data = #{data}"
      @auth_token = super(data)
    end

    def register_user
      user_data = {
        provider: PROVIDER,
        identifer: @identifer,
        name: @rp.user_profile['first_name'],
        full_name: @rp.user_profile['name'],
        email: @rp.user_profile['email'],
        picture: @rp.user_profile['picture']['data']['url']
      }
      logger.debug "-------- user_data = #{user_data}"
      @user = super user_data
    end
  end
end
