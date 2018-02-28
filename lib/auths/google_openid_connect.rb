module Auths
  # Operator for Google Openid Connect
  class GoogleOpenidConnect < Authorize
    include GoogleJwtToken

    attr_accessor :state, :code
    attr_reader :access_token, :id_token
    attr_reader :user_profile

    def authorization_endpoint_uri
      host = conf['auth_endpoint_host']
      path = conf['auth_endpoint_path']
      query = query_for_authorization
      "#{host}#{path}?#{query}"
    end

    def obtain_access_token
      res = post_endpoint(conf['token_endpoint_host'],
                          conf['token_endpoint_path'],
                          nil,
                          body_for_token_endpoint)
      return parse_access_token res.body if res.status == 200

      raise(Auths::Error::Unauthorized,
            "error on obtaining access token: #{res.status}")
    end

    def validate_id_token
      validate_jwt_token @id_token
    end

    def obtain_user_profile
      res = get_endpoint(conf['userinfo_endpoint_host'],
                         conf['userinfo_endpoint_path'],
                         @access_token)
      return parse_user_profile res.body if res.status == 200

      raise(Auths::Error::Unauthorized,
            "error on obtaining user data: #{res.status}")
    end

    private

    def query_for_authorization
      hash2qstr(
        client_id: conf['client_id'],
        response_type: 'code',
        scope: 'openid email profile',
        redirect_uri: conf['redirect_uri'],
        state: @state,
        nonce: '0394852-3190485-2490358'
      )
    end

    def body_for_token_endpoint
      {
        code: @code,
        client_id: conf['client_id'],
        client_secret: conf['client_secret'],
        redirect_uri: conf['redirect_uri'],
        grant_type: conf['grant_type']
      }
    end

    def parse_access_token(body)
      hash = JSON.parse(body)
      @id_token = hash['id_token']
      @access_token = hash['access_token']
    end

    def parse_user_profile(body)
      @user_profile = JSON.parse(body)
    end
  end
end
