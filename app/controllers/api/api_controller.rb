#
# module for Errors
#
module Api
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
end

#
# module for game.link api
#
module Api
  #
  # Super class for game.link api contoroller classes
  #
  class ApiController < ApplicationController
    before_action :authenticated?

    rescue_from StandardError, with: :handle_500_error
    rescue_from ActiveRecord::RecordInvalid, with: :handle_422_error
    rescue_from BusinessError, with: :handle_business_error

    private

    # Check authenticated
    def authenticated?
      # TODO: Under constructions
      @user_id = 1
    end

    # Standard Error handler
    def handle_500_error(err)
      error_datas = []
      error_datas.push(level: 'fatal', message: err.message)
      render json: error_datas, status: 500
    end

    # Validate Error handler
    def handle_422_error(invalid)
      error_datas = []
      invalid.record.errors.full_messages.each do |msg|
        error_datas.push(level: 'warning', message: msg)
      end
      render json: error_datas, status: 422
    end

    # Business Error handler
    def handle_business_error(err)
      error_datas = []
      error_datas.push(level: err.error_level, message: err.message)
      render json: error_datas, status: err.http_status
    end
  end
end
