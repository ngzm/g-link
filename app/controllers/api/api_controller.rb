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
    rescue_from BusinessError, with: :handle_business_error

    private

    # Check authenticated
    def authenticated?
      # TODO: Under constructions
      @user_id = 1
    end

    # Error handler
    def handle_business_error(e)
      @error = e
      error_data = { level: e.error_level, message: e.message }
      render json: error_data, status: e.http_status
    end
  end
end
