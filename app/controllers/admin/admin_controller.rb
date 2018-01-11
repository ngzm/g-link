module Admin
  # Admin super class
  class AdminController < ApplicationController
    include Authentication

    before_action :authenticate?, except: %i[main login]

    def main; end

    def login
      @logined = authenticate_token
    end

    private

    def authenticate?
      return if authenticate_token

      ctkn = 'admin'
      ruri = '/admin/admin/login'
      url = "/rp/main/index?client_token=#{ctkn}&redirect_uri=#{ruri}"
      redirect_to url
    end

    def authenticate_token
      id_token = session[:id_token]
      return false if id_token.nil?
      @user = authenticate_id_token(id_token)
      true
    rescue Auths::Error::AuthError
      session.delete(:id_token)
      false
    end
  end
end
