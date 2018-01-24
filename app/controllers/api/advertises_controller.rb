module Api
  #
  # Controller for Advertises ajax from client
  #
  class AdvertisesController < ApiController
    before_action :check_adtype, only: :search
    skip_before_action :authenticated?

    # Get all advertise datas.
    def index
      @advertises = Advertise.all
      render 'index', formats: 'json', handlers: 'jbuilder'
    end

    # Search by adtype (Home or Ranking or .. view)
    def search
      @advertises = Advertise.where(adtype: @adtype)
                             .where(show: true)
                             .order(:priority)
      render 'search', formats: 'json', handlers: 'jbuilder'
    end

    private

    # Check parameter adtype
    def check_adtype
      @adtype = params[:adtype]
      return if @adtype =~ /^\d+$/
      raise BadRequest, "Invalid adtype: #{@adtype}"
    end
  end
end
