module Auths
  # handling id token which is Json Web Token
  class IdToken
    include Config
    ISS = 'freegame.link'.freeze

    class << self
      def id_token(identifer)
        idt = IdToken.new
        payload = idt.generate_payload(identifer)
        idt.encode_id_token(payload)
      end

      def validate(id_token)
        idt = IdToken.new
        payload = idt.decode_id_token(id_token)
        idt.validate_id_token_payload(payload)
        payload
      end
    end

    def initialize
      @iat = Time.now.to_i
      @exp = @iat + 24 * 60 * 60
      @jti = SecureRandom.base64(16)
      @aud = "#{gconf['client_id']}|#{tconf['consumer_key']}"
      @secret = fconf['app_secret']
    end

    def generate_payload(identifer)
      {
        iss: ISS,
        nbf: @iat,
        iat: @iat,
        exp: @exp,
        jti: @jti,
        aud: @aud,
        sub: identifer
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
