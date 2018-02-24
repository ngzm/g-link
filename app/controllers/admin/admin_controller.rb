module Admin
  # Admin super class
  class AdminController < ApplicationController
    include Authentication

    before_action :authenticate, except: %i[main]

    def main
      @logined = authenticate_token
    end

    def login; end

    def logout
      session.delete(:id_token)
      redirect_to admin_admin_main_path
    end

    private

    def authenticate
      @logined = authenticate_token
      return if @logined

      #
      # TODO: add generate client token
      ctkn = 'admin'
      # TODO: add generate client token
      #
      ruri = '/admin/admin/main'
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
