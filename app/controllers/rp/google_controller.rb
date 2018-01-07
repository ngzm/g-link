module Rp
  # Authenticate and Authorize by Google endpoint
  class GoogleController < RpController
    before_action :new_rp
    before_action :check_show_param, only: :show
    skip_before_action :check_create_param, except: :create

    PROVIDER = 'google'.freeze

    # Request to google authorization_endpoint
    def create
      register_auth_token
      redirect_to @rp.authrization_endpoint(@client_token)
    end

    # Confirm anti-forgery state token
    # Exchange code for access token and ID token
    # Validate ID token and authenticate the user
    # Obtaining user profile information
    def show
      @client_token = @rp.validate_state_token(@state)

      @id_token, @access_token = @rp.exchange_code(@code)
      @rp.validate_id_token(@id_token)
      profile = @rp.obtain_user_profile(@access_token)

      register_user(profile)
      update_auth_token

      redirect_to @auth_token.redirect_uri
    end

    private

    # Register auth_tokens table
    def register_auth_token
      AuthToken.create_or_update(@client_token, @redirect_uri, PROVIDER)
    end

    # Register user info
    def register_user(profile)
      User.create_or_update(profile)
    end

    # update id_token of the auth_token table
    def update_auth_token
      @auth_token = AuthToken.find_by(client_token: @client_token)
      raise 'client_token is NOT FOUND' if @auth_token.nil?
      @auth_token.update!(id_token: @id_token, access_token: @access_token)
    end

    # Check parameters for show method
    def check_show_param
      @state = params[:state]
      @code = params[:code]
      raise 'Missing parameter state' if @state.nil?
      raise 'Missing parameter code' if @code.nil?
    end

    # New RP instance
    def new_rp
      @rp = Auths::Rp::GoogleOpenidConnect.new
    end
  end
end
