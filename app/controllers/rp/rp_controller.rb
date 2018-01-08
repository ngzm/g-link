# module for Relaying Party of Openid_connect or Oauth2
module Rp
  # Super class for Relaying Party for Openid_connect or Oauth2
  class RpController < ApplicationController
    before_action :check_create_param

    # Check parameters for create method
    def check_create_param
      @client_token = params[:client_token]
      @redirect_uri = params[:redirect_uri]
      raise 'Missing parameter client_token' if @client_token.nil?
      raise 'Missing parameter redirect_uri' if @redirect_uri.nil?
    end
  end
end
