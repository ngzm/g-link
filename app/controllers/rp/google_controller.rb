module Rp
  # Authenticate and Authorize by Google endpoint
  class GoogleController < RpController
    before_action :provider
    before_action :initialize_provider_for_create, only: :create
    before_action :check_show_param, :check_show_session, only: :show
    before_action :initialize_provider_for_show, only: :show
    after_action :register_create_session, only: :create
    after_action :register_show_session, only: :show
    skip_before_action :check_create_param, except: :create

    PROVIDER = 'google'.freeze

    def create
      # register initial auth data to auth_tokens table
      register_auth_token

      # Request to google authorization_endpoint
      redirect_to @provider.authorization_endpoint_uri
    end

    def show
      # Confirm anti-forgery state
      confirm_state(@state)

      # Exchange code for access_token and google id_token
      @provider.obtain_access_token

      # Validate google id_token and authenticate the user
      @provider.validate_id_token

      # Obtaining user profile information
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

    def initialize_provider_for_create
      @provider.state = state_from_client_token
    end

    def register_create_session
      session[:client_token] = @client_token
    end

    def check_show_param
      @state = params[:state]
      @code = params[:code]
      raise 'Missing parameter state' if @state.nil?
      raise 'Missing parameter code' if @code.nil?
    end

    def check_show_session
      @client_token = session[:client_token]
      raise 'Missing session client_token' if @client_token.nil?
    end

    def initialize_provider_for_show
      @provider.code = @code
    end

    def register_show_session
      # It's for admin menu, look up id_token when it is admin menu.
      session[:id_token] = @id_token if @user.admin

      # delete session
      session[:client_token] = nil
    end

    def id_token
      gid = @provider.user_profile['sub']
      @identifer = "#{gid}@#{PROVIDER}"
      @id_token = super(@identifer)
    end

    def register_auth_token
      super PROVIDER
    end

    def update_auth_token
      data = {
        id_token: @id_token,
        provider_access_token: @provider.access_token,
        provider_id_token: @provider.id_token
      }
      logger.debug "------- auth_token_data = #{data}"
      @auth_token = super(data)
    end

    def register_user
      user_data = {
        name: @provider.user_profile['given_name'],
        full_name: @provider.user_profile['name'],
        email: @provider.user_profile['email'],
        picture: @provider.user_profile['picture'],
        identifer: @identifer
      }
      logger.debug "-------- user_data = #{user_data}"
      @user = super user_data
    end
  end
end
