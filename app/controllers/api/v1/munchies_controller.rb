class Api::V1::MunchiesController < ApplicationController

  def show
    origin = params[:start]
    destination = params[:end]

    LocationFacade.travel_time(origin, destination)

  end
end
