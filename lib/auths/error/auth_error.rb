module Auths
  module Error
    # Authentication Error
    class AuthError < RuntimeError
      def http_status
        :unauthorized
      end

      def error_level
        'warning'
      end
    end

    # Authentication Error
    class Unauthorized < AuthError
    end

    #  Forbidden Error
    class Forbidden < AuthError
      def http_status
        :forbidden
      end
    end
  end
end
