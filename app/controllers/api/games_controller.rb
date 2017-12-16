module Api
  #
  # game.link controller of the games
  #
  class GamesController < Api::ApiController
    before_action :check_category_id, only: :index
    before_action :check_game_id, except: :index

    #
    # Get games list belongs to the specified category
    #
    def index
      @games = Game.where(category1: @category_id)
                   .or(Game.where(category2: @category_id))
                   .or(Game.where(category3: @category_id))
      if @games.empty?
        head :not_found
      else
        # TODO: Just for Test. Do not forget to delete when finish the test.
        # render json: { message: 'err!!' }, status: :bad_request
        # return

        # TODO: Just for Test. Do not forget to delete when finish the test.
        # raise 'error !!'
        # sleep 1

        render 'index', formats: 'json', handlers: 'jbuilder'
      end
    end

    #
    # Get game data specified by the game_id
    #
    def show
      @game = Game.includes(:instructions, :reviews, :users)
                  .find_by_id(@game_id)
      if @game
        @instructions = @game.ordered_instructions
        @reviews = @game.newer_reviews_top(7)

        # TODO: Just for Test. Do not forget to delete when finish the test.
        # render json: { message: 'err!!' }, status: :bad_request
        # return

        # TODO: Just for Test. Do not forget to delete when finish the test.
        # raise 'error !!'
        # sleep 1

        render 'show', formats: 'json', handlers: 'jbuilder'
      else
        head :not_found
      end
    end

    # private methods
    private

    # Check parameter category_id
    def check_category_id
      @category_id = params[:category_id]
      return if @category_id =~ /^\d+$/

      error_data = {
        status: 401,
        message: "Invalid category id : #{@category_id}"
      }

      # TODO: create error json builder
      render json: error_data, status: :bad_request
    end

    # Check parameter game_id
    def check_game_id
      @game_id = params[:game_id]
      return if @game_id =~ /^\d+$/

      error_data = {
        status: 401,
        message: "Invalid game id : #{@game_id}"
      }

      # TODO: create error json builder
      render json: error_data, status: :bad_request
    end
  end
end
