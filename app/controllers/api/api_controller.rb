#
# module for game.link api
#
module Api
  #
  # Super class for game.link api contoroller classes
  #
  class ApiController < ApplicationController
    before_action :authenticated?

    private

    # Check authenticated
    def authenticated?
      # TODO: Under constructions
      @user_id = 1
    end
  end
end
