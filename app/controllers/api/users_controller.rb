module Api
  #
  # UsersController
  #
  class UsersController < ApiController
    include Authentication

    before_action :check_client_token, only: :exchange_auth_token
    before_action :check_id_token, only: :auth
    skip_before_action :authenticated?

    # Exchange client_token to id_token
    def exchange_auth_token
      @id_token = from_client_to_id_token(@client_token)
      render 'exchange_auth_token', formats: 'json', handlers: 'jbuilder'
    end

    # Authenticate id_token
    def auth
      @user = authenticate_id_token(@id_token)
      render 'auth', formats: 'json', handlers: 'jbuilder'
    end

    private

    # Check client_token
    def check_client_token
      @client_token = params[:client_token]
      return unless @client_token.nil?
      raise BadRequest, 'Missing parameter client_token'
    end

    # Check id_token
    def check_id_token
      @id_token = params[:id_token]
      return unless @id_token.nil?
      raise BadRequest, 'Missing parameter id_token'
    end
  end
end
