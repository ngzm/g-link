# module for game.link api
module Api
  # module for Errors
  # BusinessError base class
  class BusinessError < RuntimeError
    def http_status
      :internal_server_error
    end

    def error_level
      'warning'
    end
  end

  # Internal server error
  class ServerError < BusinessError
    def error_level
      'error'
    end
  end

  # Badrequest error
  class BadRequest < BusinessError
    def http_status
      :bad_request
    end
  end

  # Recored not found error
  class RecordNotFound < BusinessError
    def http_status
      :not_found
    end
  end

  # Super class for game.link api contoroller classes
  class ApiController < ApplicationController
    include Authentication

    before_action :authenticated?
    rescue_from StandardError, with: :handle_500_error
    rescue_from ActiveRecord::RecordInvalid, with: :handle_422_error
    rescue_from Auths::Error::AuthError, with: :handle_auth_error
    rescue_from BusinessError, with: :handle_business_error

    private

    # Check authenticated
    def authenticated?
      raise Auths::Error::Unauthorized, 'Faild to authenticate' \
        unless authenticate_token
    end

    # Check authenticated token
    def authenticate_token
      authenticate_with_http_token do |token|
        user = authenticate_id_token(token)
        @user_id = user.id
        return true
      end
    end

    # Standard Error handler
    def handle_500_error(err)
      # TODO: ログ出す処理を追加
      error_datas = []
      error_datas.push(level: 'fatal', message: err.message)
      render json: error_datas, status: 500
    end

    # Validate Error handler
    def handle_422_error(invalid)
      # TODO: ログ出す処理を追加
      error_datas = []
      invalid.record.errors.full_messages.each do |msg|
        error_datas.push(level: 'warning', message: msg)
      end
      render json: error_datas, status: 422
    end

    # Auth Error handler
    def handle_auth_error(err)
      # TODO: ログ出す処理を追加
      error_datas = []
      error_datas.push(level: err.error_level, message: err.message)
      render json: error_datas, status: err.http_status
    end

    # Business Error handler
    def handle_business_error(err)
      # TODO: ログ出す処理を追加
      error_datas = []
      error_datas.push(level: err.error_level, message: err.message)
      render json: error_datas, status: err.http_status
    end
  end
end
