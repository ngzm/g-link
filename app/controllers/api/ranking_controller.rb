module Api
  #
  # Ranking Controller
  #
  class RankingController < ApiController
    before_action :check_fetch_size, only: :index
    skip_before_action :authenticated?

    # get ranking
    def index
      @updates = Game.order(created_at: :desc).limit(@fsize)
      @stars = Game.order(star: :desc).limit(@fsize)
      @accesses = Game.order(access: :desc).limit(@fsize)
      render 'index', formats: 'json', handlers: 'jbuilder'
    end

    # private methods
    private

    # Check parameter category_id
    def check_fetch_size
      @fsize = params[:fsize]
      @fsize = '10' unless @fsize =~ /^\d+$/
      @fsize = '100' if @fsize.to_i > 100
    end
  end
end
