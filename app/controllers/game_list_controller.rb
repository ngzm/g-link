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

  def detail
    id = params[:game_id]
    if (id =~ /^\d+$/)
      @gdetail = Game.includes(:instructions, :reviews, :users).find(id)
      @instructions = @gdetail.instructions.sort { |a, b| a.id <=> b.id }
      @reviews = @gdetail.reviews.sort { |a, b| b.id <=> a.id }[0, 7]
    end
    render 'detail', formats: 'json', handlers: 'jbuilder'
  end
end
