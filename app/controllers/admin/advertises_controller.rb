module Admin
  #
  # Admin advertise controller
  #
  class AdvertisesController < AdminController
    before_action :set_advertise, only: %i[show edit update destroy]

    # GET /advertises
    def index
      @advertises = Advertise.all.order({ show: :DESC }, :adtype, :priority)
    end

    # GET /advertises/1
    def show; end

    # GET /advertises/new
    def new
      @advertise = Advertise.new
    end

    # GET /advertises/1/edit
    def edit; end

    # POST /advertises
    def create
      @advertise = Advertise.new(advertise_params)

      respond_to do |format|
        if @advertise.save
          format.html { redirect_to [:admin, @advertise], notice: 'Advertise was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /advertises/1
    def update
      respond_to do |format|
        if @advertise.update(advertise_params)
          format.html { redirect_to [:admin, @advertise], notice: 'Advertise was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /advertises/1
    def destroy
      @advertise.destroy
      respond_to do |format|
        format.html { redirect_to admin_advertises_url, notice: 'Advertise was successfully destroyed.' }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertise_params
      params.require(:advertise).permit(:title, :description, :src, :adtype, :priority, :show)
    end
  end
end
