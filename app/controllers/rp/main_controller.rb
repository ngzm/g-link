module Rp
  # User authentication main class
  class MainController < RpController
    before_action :clean_auth_tokens, :check_create_param
    def index; end
  end
end
