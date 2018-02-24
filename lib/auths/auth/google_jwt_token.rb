module Auths
  # Module for Relay Provider (RP) on OprnID connect
  module Auth
    # module for Google jwt tokens
    module GoogleJwtToken
      include Auths::Config

      # Validate id_token
      def validate_jwt_token(token)
        payload = validate_jwt(token)
        validate_aud(payload)
        validate_iss(payload)
        validate_exp(payload)
      end

      # Validate ID token which is JWT
      def validate_jwt(token)
        validator = GoogleIDToken::Validator.new
        validator.check(token, conf['client_id'])
      rescue GoogleIDToken::ValidationError => e
        raise Auths::Error::Unauthorized, "Invalid ID token: #{e}"
      end

      # aud must equal to client_id
      def validate_aud(payload)
        raise 'Invalid client id' unless payload['aud'] == conf['client_id']
      end

      # iss must equal to issuer
      def validate_iss(payload)
        raise 'Invalid issuer' unless payload['iss'] == conf['issuer']
      end

      # This ID token is not expired
      def validate_exp(payload)
        raise 'Already expired' if payload['exp'].to_i < Time.now.to_i
      end
    end
  end
end
