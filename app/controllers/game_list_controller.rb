#
# Games list
#
class GameListController < ApplicationController
  def index
    @games = []

    cid = params[:category_id]
    if cid =~ /^\d\d?$/
      @games = Game.where(category1: cid)
                   .or(Game.where(category2: cid))
                   .or(Game.where(category3: cid))
    end
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def detail
    id = params[:game_id]
    if id =~ /^\d+$/
      @gdetail = Game.includes(:instructions, :reviews, :users).find(id)
      @instructions = @gdetail.instructions.sort { |a, b| a.id <=> b.id }
      @reviews = @gdetail.reviews.sort { |a, b| b.id <=> a.id }[0, 7]
    end
    render 'detail', formats: 'json', handlers: 'jbuilder'
  end

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
      sleep 2
      render 'review', formats: 'json', handlers: 'jbuilder'
    else
      head :not_found
    end
  end

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

    unless @review.update update_review_params
      head :internal_server_error
      return
    end

    render 'review', formats: 'json', handlers: 'jbuilder'
  end

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
    @review = Review.create({ game_id: gid, user_id: uid }.merge(update_review_params))
    unless @review
      head :internal_server_error
      return
    end

    render 'review', formats: 'json', handlers: 'jbuilder'
  end

  private

  def update_review_params
    params.require(:review).permit(:comment, :star)
  end
end
