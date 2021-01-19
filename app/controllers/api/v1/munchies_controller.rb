class Api::V1::MunchiesController < ApplicationController

  def show
    origin = params[:start]
    destination = params[:end]
    cuisine = params[:food]

    LocationFacade.travel_time(origin, destination)

    YelpFacade.find_restaurants(destination, cuisine)
    
  end
end
