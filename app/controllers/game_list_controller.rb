#
# Games list
#
class GameListController < ApplicationController
  #
  # Get games list belongs to the specified category
  #
  def index
    @games = []

    cid = params[:category_id]
    if cid =~ /^\d\d?$/
      @games = Game.where(category1: cid)
                   .or(Game.where(category2: cid))
                   .or(Game.where(category3: cid))
    end

    # TODO: dummy
    sleep 1
    # TODO: dummy

    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  #
  # Get game data
  #
  def detail
    id = params[:game_id]
    if id =~ /^\d+$/
      @gdetail = Game.includes(:instructions, :reviews, :users).find(id)
      @instructions = @gdetail.instructions.sort { |a, b| a.id <=> b.id }
      @reviews = @gdetail.reviews.sort { |a, b| b.updated_at <=> a.updated_at }[0, 7]
    end

    # TODO: dummy
    sleep 1
    # TODO: dummy

    render 'detail', formats: 'json', handlers: 'jbuilder'
  end

  #
  # Get game review data
  #
  def review
    # とりあえずユーザIDは仮に1とする
    # 本当は、認証tokenから取得する仕様とする
    uid = 1
    gid = params[:game_id]
    unless gid =~ /^\d+$/
      head :internal_server_error
      return
    end
    @review = Review.find_by(game_id: gid, user_id: uid)
    if @review

      # TODO: dummy
      sleep 1
      # TODO: dummy

      render 'review', formats: 'json', handlers: 'jbuilder'
    else
      head :not_found
    end
  end

  #
  # Update game review data
  #
  def rupdate
    # とりあえずユーザIDは仮に1とする
    # 本当は、認証tokenから取得する仕様とする
    uid = 1
    gid = params[:game_id]
    unless gid =~ /^\d+$/
      head :internal_server_error
      return
    end

    params[:review] = JSON.parse(request.body.read, symbolize_names: true)
    @review = Review.find_by(game_id: gid, user_id: uid)
    unless @review
      head :internal_server_error
      return
    end

    @review.update_review update_review_params

    # TODO: dummy
    sleep 1
    # TODO: dummy

    render 'review', formats: 'json', handlers: 'jbuilder'
  end

  #
  # Create game review data
  #
  def rcreate
    # とりあえずユーザIDは仮に1とする
    # 本当は、認証tokenから取得する仕様とする
    uid = 1
    gid = params[:game_id]
    unless gid =~ /^\d+$/
      head :internal_server_error
      return
    end

    params[:review] = JSON.parse(request.body.read, symbolize_names: true)
    params_review = { game_id: gid, user_id: uid }.merge(update_review_params)
    @review = Review.create_review(params_review)

    # TODO: dummy
    sleep 1
    # TODO: dummy

    render 'review', formats: 'json', handlers: 'jbuilder'
  end

  private

  def update_review_params
    params.require(:review).permit(:comment, :star)
  end
end
