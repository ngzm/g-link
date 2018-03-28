module Api
  #
  # game.link controller of the games
  #
  class GamesController < ApiController
    before_action :check_id, only: %i[show play]
    before_action :check_category_id, only: :search
    skip_before_action :authenticated?

    #
    # Get games list belongs to the specified category
    #
    def index
      @games = Game.all
      raise RecordNotFound, 'No records on games' if @games.empty?

      # TODO: Just for Test. Do not forget to delete when finish the test.
      # raise 'error !!'
      # sleep 1

      render 'index', formats: 'json', handlers: 'jbuilder'
    end

    #
    # Get game data specified by the game_id
    #
    def show
      @game = Game.includes(:instructions, :reviews, :users).find_by_id(@id)
      raise RecordNotFound, 'Not found' if @game.nil?

      @instructions = @game.ordered_instructions
      @reviews = @game.newer_reviews_top(7)
      render 'show', formats: 'json', handlers: 'jbuilder'
    end

    #
    # Get games list belongs to the specified category
    #
    def search
      @games = Game.where(category1: @category_id)
                   .or(Game.where(category2: @category_id))
                   .or(Game.where(category3: @category_id))
      raise RecordNotFound, 'No games found' if @games.empty?

      render 'index', formats: 'json', handlers: 'jbuilder'
    end

    #
    # Play games, it means to count up access counter.
    #
    def play
      @game = Game.find_by_id(@id)
      raise RecordNotFound, 'Not found' if @game.nil?

      @game.increment_access
      render 'play', formats: 'json', handlers: 'jbuilder'
    end

    # private methods
    private

    # Check parameter category_id
    def check_category_id
      @category_id = params[:category_id]
      return if @category_id =~ /^\d+$/
      raise BadRequest, "Invalid category id: #{@category_id}"
    end

    # Check parameter id
    def check_id
      @id = params[:id]
      return if @id =~ /^\d+$/
      raise BadRequest, "Invalid game id: #{@id}"
    end
  end
end
