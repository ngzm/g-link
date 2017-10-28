#
# Games list
#
class GameListController < ApplicationController
  def index
    cid = params[:category_id]
    @games = Game.where(category1: cid)
                 .or(Game.where(category2: cid))
                 .or(Game.where(category3: cid))
    render json: @games
  end
end
