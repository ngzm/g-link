module Auths
  module Auth
    # handling id token which is Json Web Token
    class IdToken
      include Auths::Config
      ISS = 'https.freegame.link/issuer'.freeze

      def initialize(client_token)
        @aud = client_token
        @iat = Time.now.to_i
        @exp = @iat + 24 * 60 * 60
        @jti = SecureRandom.base64(8)
        @secret = "#{conf['client_secret']}|#{fconf['app_secret']}"
      end

      def generate_payload(identifer)
        {
          iss: ISS,
          nbf: @iat,
          iat: @iat,
          exp: @exp,
          jti: @jti,
          aud: @aud,
          ident: identifer
        }
      end

      def encode_id_token(payload)
        JWT.encode payload, @secret, 'HS256'
      end

      def decode_id_token(token)
        (JWT.decode token, @secret, true, algorithm: 'HS256')[0]
      rescue JWT::DecodeError => e
        raise Auths::Error::Unauthorized, e.message
      end

      def validate_id_token_payload(payload)
        raise Auth::Error::Unauthorized, 'iss is not valid' \
          unless payload['iss'] == ISS

        raise Auth::Error::Unauthorized, 'aud is not valid' \
          unless payload['aud'] == @aud
      end
    end
  end
end
