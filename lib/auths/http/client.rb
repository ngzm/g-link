module Auths
  # Modules about Http(s) operation
  module Http
    # Http(s) client for openID connect or Oauth2
    module Client
      # Get
      def http_get(host, path, query = nil, token = nil)
        conn = setup_client(host, token)
        if query.nil?
          conn.get path
        else
          conn.get path, query
        end
      end

      # Post
      def http_post(host, path, body, token = nil)
        conn = setup_client(host, token)
        conn.post path, body
      end

      # hash2query
      def hash2query(hash)
        qstr = ''
        hash.each do |k, v|
          qstr += '&' unless qstr.empty?
          qstr += "#{k}=#{v}"
        end
        qstr
      end

      private

      def setup_client(server, token)
        conn = Faraday.new(url: server) do |client|
          client.request :oauth2, token unless token.nil?
          client.request :url_encoded
          client.adapter Faraday.default_adapter
        end
        conn
      end
    end
  end
end
