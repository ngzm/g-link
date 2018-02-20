module Auths
  # Module for Relay Provider (RP) on OprnID connect
  module Rp
    # Operator for Google Open id connect
    class GoogleOpenidConnect
      include Auths::Config
      include Auths::Http::Client
      include GoogleJwtToken

      # Get redirect uri to google authentication end point
      def authrization_endpoint(client_token)
        url = gen_authentication_url
        query = gen_authentication_query(client_token)
        "#{url}?#{query}"
      end

      # Validate anti-forgery state token
      def validate_state_token(state_token)
        state = split_state_token(state_token)
        raise Auths::Error::Unauthorized, 'anti forgery error' \
          unless state[:seed_state_token] == conf['seed_state_token']
        state[:client_token]
      end

      # Exchange code for access token and ID token
      def exchange_code(code)
        token = post_to_token_endpoint(gen_exchange_request(code))
        [token[:id_token], token[:access_token]]
      end

      # Validate id_token
      def validate_id_token(token)
        validate_jwt_token(token)
      end

      # Obtain user profile from userinfo_endpoint
      def obtain_user_profile(access_token)
        get_userinfo_endpoint(access_token)
      end

      private

      # Generate authentication request to Google
      def gen_authentication_url
        "#{conf['auth_endpoint_host']}#{conf['auth_endpoint_path']}"
      end

      # Generate authentication request to Google
      def gen_authentication_query(client_token)
        hash2query(
          client_id: conf['client_id'],
          response_type: 'code',
          scope: 'openid email profile',
          redirect_uri: conf['redirect_uri'],
          state: gen_state_token(client_token),
          nonce: '0394852-3190485-2490358'
        )
      end

      # state_token_separator
      def separator
        '__s_e_p_a_r_a_t_o_r__'
      end

      # generate state token
      def gen_state_token(client_token)
        "#{conf['seed_state_token']}#{separator}#{client_token}"
      end

      # split_state_token
      def split_state_token(state_token)
        /^(.+)#{separator}(.+)$/ =~ state_token
        {
          seed_state_token: Regexp.last_match(1),
          client_token: Regexp.last_match(2)
        }
      end

      # Generate exchange request to google token_endpoint
      def gen_exchange_request(code)
        {
          code: code,
          client_id: conf['client_id'],
          client_secret: conf['client_secret'],
          redirect_uri: conf['redirect_uri'],
          grant_type: conf['grant_type']
        }
      end

      # Post token_endpoint.
      # Exchange code for access token and ID token
      def post_to_token_endpoint(post)
        res = http_post(conf['token_endpoint_host'],
                        conf['token_endpoint_path'],
                        post)
        token_params(JSON.parse(res.body))
      end

      # Google token data to params
      def token_params(token)
        {
          id_token: token['id_token'],
          access_token: token['access_token']
        }
      end

      # Get user profile data from userinfo_endpoint.
      def get_userinfo_endpoint(access_token)
        # must contain Authentication header access_token
        res = http_get(conf['userinfo_endpoint_host'],
                       conf['userinfo_endpoint_path'],
                       nil,
                       access_token)
        profile_params(JSON.parse(res.body))
      end

      # Google profile data to params
      def profile_params(profile)
        puts "profile = #{profile}"

        {
          identifer: "#{profile['sub']}@google",
          name: profile['given_name'],
          full_name: profile['name'],
          email: profile['email'],
          picture: profile['picture']
        }
      end
    end
  end
end
