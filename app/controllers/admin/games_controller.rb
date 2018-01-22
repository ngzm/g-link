module Admin
  #
  # Admin game controller
  #
  class GamesController < AdminController
    before_action :set_game, only: %i[show edit update destroy]

    # GET /games
    def index
      @games = Game.all
    end

    # GET /games/1
    def show; end

    # GET /games/new
    def new
      @game = Game.new
    end

    # GET /games/1/edit
    def edit; end

    # POST /games
    def create
      @game = Game.new(game_params)

      respond_to do |format|
        if @game.save
          format.html { redirect_to [:admin, @game], notice: 'Game was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /games/1
    def update
      respond_to do |format|
        if @game.update(game_params)
          format.html { redirect_to [:admin, @game], notice: 'Game was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /games/1
    def destroy
      @game.destroy
      respond_to do |format|
        format.html { redirect_to admin_games_url, notice: 'Game was successfully destroyed.' }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :description, :category1, :category2, :category3, :url, :img, :gtype)
    end
  end
end
