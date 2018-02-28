# module for Relaying Party of Openid_connect or Oauth2
module Rp
  # Super class for Relaying Party for Openid_connect or Oauth2
  class RpController < ApplicationController
    before_action :check_create_param

    rescue_from Auths::Error::AuthError, with: :handle_auth_error

    SEPARATOR = '__s_e_p_a_r_a_t_o_r__'.freeze

    private

    def check_create_param
      @client_token = params[:client_token]
      @redirect_uri = params[:redirect_uri]
      raise 'Missing parameter client_token' if @client_token.nil?
      raise 'Missing parameter redirect_uri' if @redirect_uri.nil?
    end

    def provider(provider)
      @provider = Auths::Auth::Authorize.provider(provider)
    end

    def register_auth_token(provider)
      AuthToken.create_or_update(@client_token, @redirect_uri, provider)
    end

    def update_auth_token(auth_token_data)
      auth_token = AuthToken.find_by(client_token: @client_token)
      raise 'client_token is NOT FOUND' if auth_token.nil?
      auth_token.update!(auth_token_data)
      auth_token
    end

    def register_user(user_data)
      User.create_or_update(user_data)
    end

    def id_token(identifer)
      Auths::Auth::IdToken.id_token(identifer)
    end

    def confirm_state(state)
      raise Auths::Error::Unauthorized, "state is invalid #{state}" \
        unless state == state_from_client_token
    end

    def state_from_client_token
      "#{seed_state_token}#{SEPARATOR}#{@client_token}"
    end

    def seed_state_token
      '--french-connetciton-seed-state-token--'
    end

    # Auth Error handler
    def handle_auth_error(err)
      logger.warn("AUTH ERROR: status: #{err.http_status}: #{err.message}")
      @errors = []
      @errors.push(
        level: err.error_level,
        message: err.message,
        status: err.http_status
      )
      render template: 'errors/auth', status: err.http_status
    end
  end
end
