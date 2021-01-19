class Api::V1::MunchiesController < ApplicationController

  def show
    origin = params[:start]
    destination = params[:end]
    cuisine = params[:food]

    travel_time = LocationFacade.travel_time(origin, destination)
    eta = (Time.now.to_i + travel_time)
    
    YelpFacade.find_restaurants(destination, cuisine, eta)
    require "pry"; binding.pry
  end
end
