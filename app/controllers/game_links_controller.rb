class GameLinksController < ApplicationController
  before_action :set_game_link, only: [:show, :edit, :update, :destroy]

  # GET /game_links
  # GET /game_links.json
  def index
    @game_links = GameLink.all
  end

  # GET /game_links/1
  # GET /game_links/1.json
  def show
  end

  # GET /game_links/new
  def new
    @game_link = GameLink.new
  end

  # GET /game_links/1/edit
  def edit
  end

  # POST /game_links
  # POST /game_links.json
  def create
    @game_link = GameLink.new(game_link_params)

    respond_to do |format|
      if @game_link.save
        format.html { redirect_to @game_link, notice: 'Game link was successfully created.' }
        format.json { render :show, status: :created, location: @game_link }
      else
        format.html { render :new }
        format.json { render json: @game_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_links/1
  # PATCH/PUT /game_links/1.json
  def update
    respond_to do |format|
      if @game_link.update(game_link_params)
        format.html { redirect_to @game_link, notice: 'Game link was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_link }
      else
        format.html { render :edit }
        format.json { render json: @game_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_links/1
  # DELETE /game_links/1.json
  def destroy
    @game_link.destroy
    respond_to do |format|
      format.html { redirect_to game_links_url, notice: 'Game link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_link
      @game_link = GameLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_link_params
      params.require(:game_link).permit(:title, :description, :url, :img, :category1, :category2, :category3, :access, :star)
    end
end
