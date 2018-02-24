module Rp
  # User authentication main class
  class MainController < RpController
    def index
      @gp = '/rp/google/create'
      @fp = '/rp/facebook/create'
      @tp = '/rp/twitter/create'
      @p1 = "client_token=#{@client_token}"
      @p2 = "redirect_uri=#{@redirect_uri}"
    end
  end
end
