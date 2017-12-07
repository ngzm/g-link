#
# Games list
#
class GameListController < ApplicationController
  before_action :authenticated?
  before_action :check_category_id, only: :index
  before_action :check_game_id, except: :index
  before_action :parse_review_json, only: %i[rupdate rcreate]

  # Get games list belongs to the specified category
  def index
    @games = Game.where(category1: @category_id)
                 .or(Game.where(category2: @category_id))
                 .or(Game.where(category3: @category_id))
    if @games.empty?
      head :not_found
    else
      # render json: { message: 'err!!' }, status: :bad_request
      # return

      # raise 'error !!'
      sleep 1

      render 'index', formats: 'json', handlers: 'jbuilder'
    end
  end

  # Get game data
  def detail
    @gdetail = Game.includes(:instructions, :reviews, :users)
                   .find_by_id(@game_id)
    if @gdetail
      @instructions = @gdetail.ordered_instructions
      @reviews = @gdetail.newer_reviews_top(7)

      # render json: { message: 'err!!' }, status: :bad_request
      # return

      # raise 'error !!'
      sleep 1

      render 'detail', formats: 'json', handlers: 'jbuilder'
    else
      head :not_found
    end
  end

  #
  # Get game review data
  #
  def review
    @review = Review.find_by(game_id: @game_id, user_id: @user_id)
    if @review

      # render json: { message: 'err!!' }, status: :bad_request
      # return

      #raise 'error !!'

      sleep 1

      render 'review', formats: 'json', handlers: 'jbuilder'
    else
      head :not_found
    end
  end

  #
  # Update game review data
  #
  def rupdate
    @review = Review.find_by(game_id: @game_id, user_id: @user_id)
    if @review
      @review.update_review update_review_params

      # render json: { message: 'err!!' }, status: :bad_request
      # return

      # raise 'error !!'
      sleep 1

      render 'review', formats: 'json', handlers: 'jbuilder'
    else
      head :internal_server_error
    end
  end

  #
  # Create game review data
  #
  def rcreate
    params_review = { game_id: @game_id, user_id: @user_id }
                    .merge(update_review_params)

    # TODO: Have to refine create review model methods
    @review = Review.create_review(params_review)

    sleep 1

    render 'review', formats: 'json', handlers: 'jbuilder'
  end

  # Lower .. private methods
  private

  # Check authenticated
  def authenticated?
    # TODO: Under constructions
    @user_id = 1
  end

  # Check parameter category_id
  def check_category_id
    @category_id = params[:category_id]
    error_data = {
      status: 401,
      message: "Invalid category id : #{@category_id}"
    }
    render json: error_data, status: :bad_request unless @category_id =~ /^\d+$/
  end

  # Check parameter game_id
  def check_game_id
    @game_id = params[:game_id]
    error_data = {
      status: 401,
      message: "Invalid game id : #{@game_id}"
    }
    render json: error_data, status: :bad_request unless @game_id =~ /^\d+$/
  end

  # Check parameter game_id
  def parse_review_json
    params[:review] = JSON.parse(request.body.read, symbolize_names: true)
  end

  # Strong parameters
  def update_review_params
    params.require(:review).permit(:comment, :star)
  end
end
