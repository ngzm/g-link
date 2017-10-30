#
# Games list
#
class GameListController < ApplicationController
  def index
    @games = []

    cid = params[:category_id]
    if (cid =~ /^\d\d?$/)
      @games = Game.where(category1: cid)
                   .or(Game.where(category2: cid))
                   .or(Game.where(category3: cid))
    end
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
