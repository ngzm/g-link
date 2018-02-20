module Auths
  # Module for Relay Provider (RP) on OpenID connect or Oauth2
  module Rp
    # Operator for Facebook Oauth2
    class FacebookOauth2
      include Auths::Config
      include Auths::Http::Client
      # include Auths::Auth::AuthTokenForFacebook

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
          unless state[:seed_state_token] == fconf['seed_state_token']
        state[:client_token]
      end

      # Exchange code for access token and ID token
      def exchange_code(code)
        token = get_to_token_endpoint(
          gen_exchange_query(code)
        )
        token[:access_token]
      end

      # Validate access_token
      def validate_access_token(access_token)
        get_debug_access_token(
          gen_debug_access_token_query(access_token)
        )
      end

      # Obtain user profile from userinfo_endpoint
      def obtain_user_profile(access_token, validated)
        get_userinfo_endpoint(
          access_token,
          validated,
          gen_userinfo_endpoint_query
        )
      end

      private

      # Generate authentication request to Google
      def gen_authentication_url
        "#{fconf['auth_endpoint_host']}#{fconf['auth_endpoint_path']}"
      end

      # Generate authentication request to Google
      def gen_authentication_query(client_token)
        hash2query(
          client_id: fconf['app_id'],
          response_type: 'code',
          scope: 'email public_profile',
          redirect_uri: fconf['redirect_uri'],
          state: gen_state_token(client_token)
        )
      end

      # state_token_separator
      def separator
        '__s_e_p_a_r_a_t_o_r__'
      end

      # generate state token
      def gen_state_token(client_token)
        "#{fconf['seed_state_token']}#{separator}#{client_token}"
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
      def gen_exchange_query(code)
        {
          code: code,
          client_id: fconf['app_id'],
          client_secret: fconf['app_secret'],
          redirect_uri: fconf['redirect_uri']
        }
      end

      # Get token_endpoint.
      # Exchange code for access token
      def get_to_token_endpoint(query)
        res = http_get(fconf['token_endpoint_host'],
                       fconf['token_endpoint_path'],
                       query)
        return token_params(JSON.parse(res.body)) if res.status == 200

        # on error
        mesg = "token endpoint request status: #{res.status}"
        raise Auths::Error::Unauthorized, mesg
      end

      # Google token data to params
      def token_params(body)
        {
          access_token: body['access_token'],
          token_type: body['token_type'],
          expires_in: body['expires_in']
        }
      end

      # Generate debug access_token request to token_debug_endpoint
      # This is Face book logic
      def gen_debug_access_token_query(access_token)
        {
          input_token: access_token,
          access_token: "#{fconf['app_id']}|#{fconf['app_secret']}"
        }
      end

      # Debug (Validate)  access token
      # And return validate infomation including user_id
      # This is Face book logic
      def get_debug_access_token(query)
        res = http_get(fconf['token_endpoint_host'],
                       fconf['token_debug_path'],
                       query)
        return JSON.parse(res.body)['data'] if res.status == 200

        # on error
        mesg = "debug access_token request status: #{res.status}"
        raise Auths::Error::Unauthorized, mesg
      end

      # Generate useringo endpoint request
      # This is Face book logic
      def gen_userinfo_endpoint_query
        { fields: 'id,first_name,name,picture,email' }
      end

      # Get user profile data from userinfo_endpoint.
      def get_userinfo_endpoint(access_token, validated, query)
        host = fconf['userinfo_endpoint_host']
        path = "/#{validated['user_id']}"

        # must contain Authentication header access_token
        # - or may contain it in query in case of facebook
        res = http_get(host, path, query, access_token)
        return profile_params(JSON.parse(res.body)) if res.status == 200

        # on error
        mesg = "userinfo endpoint request status: #{res.status}"
        raise Auths::Error::Unauthorized, mesg
      end

      # Google profile data to params
      def profile_params(profile)
        {
          identifer: "#{profile['id']}@facebook",
          name: profile['first_name'],
          full_name: profile['name'],
          email: profile['email'],
          picture: profile['picture']['data']['url']
        }
      end
    end
  end
end
