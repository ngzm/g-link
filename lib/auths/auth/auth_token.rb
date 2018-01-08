module Auths
  # Module for Relay Provider (RP) on OprnID connect
  module Auth
    # Authenticate the open_id_connect tokens
    class AuthToken
      def self.authenticator(provider = 'google')
        if provider == 'google'
          GoogleAuthToken.new
        elsif provider == 'facebook'
          puts 'facebook'
        elsif provider == 'twitter'
          puts 'twitter'
        else
          raise "Unknown provider: #{provider}"
        end
      end

      def validate_id_token(token); end

      def email_from_id_token(token); end
    end

    # Authenticate token for Google_open_id_connect
    class GoogleAuthToken < AuthToken
      include AuthTokenForGoogle

      def validate_id_token(token)
        validate_jwt_token(token)
      end

      def email_from_id_token(token)
        payload = validate_jwt(token)
        payload['email']
      end
    end
  end
end
