module Api
  #
  # Review of the game class
  #
  class ReviewsController < ApiController
    before_action :check_game_id
    before_action :parse_json, only: %i[update create]

    # Get review of the game specified by game_id
    def show
      @review = Review.find_by(game_id: @game_id, user_id: @user_id)
      raise RecordNotFound, 'Not found' if @review.nil?

      # TODO: Just for Test. Do not forget to delete when finish the test.
      # raise 'system error ooooooooo!!'
      # sleep 1

      render 'show', formats: 'json', handlers: 'jbuilder'
    end

    # Create new review data
    def create
      params_review = { game_id: @game_id, user_id: @user_id }
                      .merge(review_params)
      @review = Review.new(params_review)
      @review.save_review
      render 'show', formats: 'json', handlers: 'jbuilder'
    end

    # Update review data
    def update
      @review = Review.find_by(game_id: @game_id, user_id: @user_id)
      raise ServerError, 'Update failed, not found the game' if @review.nil?
      @review.update_review review_params
      render 'show', formats: 'json', handlers: 'jbuilder'
    end

    # private methods
    private

    # Check parameter game_id
    def check_game_id
      @game_id = params[:game_id]
      return if @game_id =~ /^\d+$/
      raise BadRequest, "Invalid game_id: #{@game_id}"
    end

    # Parse review json data to params
    def parse_json
      params[:review] = JSON.parse(request.body.read, symbolize_names: true)
    end

    # Strong parameters
    def review_params
      params.require(:review).permit(:comment, :star)
    end
  end
end
