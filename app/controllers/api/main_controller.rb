module Api
  #
  # game.link api main controller
  #
  class MainController < ApiController
    skip_before_action :authenticated?

    # Get index.html
    def index; end
  end
end
