# module for Relaying Party of Openid_connect or Oauth2
module Rp
  # Super class for Relaying Party for Openid_connect or Oauth2
  class RpController < ApplicationController
    before_action :check_create_param

    rescue_from Auths::Error::AuthError, with: :handle_auth_error

    SEPARATOR = '__s_e_p_a_r_a_t_o_r__'.freeze
    SEED_STATE_TOKEN = '--french-connetciton-seed-state-token--'.freeze

    private

    def check_create_param
      @client_token = params[:client_token]
      @redirect_uri = params[:redirect_uri]
      raise 'Missing parameter client_token' if @client_token.nil?
      raise 'Missing parameter redirect_uri' if @redirect_uri.nil?
    end

    def rp(provider)
      @rp = Auths::Authorize.rp(provider)
    end

    def register_auth_token(auth_token_data)
      AuthToken.create_or_update(auth_token_data)
    end

    def update_auth_token(auth_token_data)
      AuthToken.update_only(auth_token_data)
    end

    def register_user(user_data)
      User.create_or_update(user_data)
    end

    def id_token(identifer)
      Auths::IdToken.id_token(identifer)
    end

    def confirm_state(state)
      state_to_client_token(state)
      raise Auths::Error::Unauthorized, "state is invalid #{state}" \
        if @client_token.nil?
    end

    def client_token_to_state
      "#{SEED_STATE_TOKEN}#{SEPARATOR}#{@client_token}"
    end

    def state_to_client_token(state)
      /^#{SEED_STATE_TOKEN}#{SEPARATOR}(.+)$/ =~ state
      @client_token = Regexp.last_match(1)
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
