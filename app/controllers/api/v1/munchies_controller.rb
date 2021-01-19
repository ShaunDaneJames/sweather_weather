class Api::V1::MunchiesController < ApplicationController

  def show
    origin = params[:start]
    destination = params[:end]
    cuisine = params[:food]

    travel_time = LocationFacade.travel_time(origin, destination)
    eta = (Time.now.to_i + travel_time)
    travel_time_hrs = (travel_time.to_f/60)/60
    restaurant_list = YelpFacade.find_restaurants(destination, cuisine, eta)

    location_coordinates = LocationFacade.get_coordinates(params[:end])
    weather_poro = WeatherFacade.get_weather_data(location_coordinates)

    poro_list = restaurant_list[:businesses].map do |business|
      RestaurantPoro.new(business, travel_time_hrs, destination, weather_poro.current_weather)
    end

    x = render json: RestaurantSerializer.new(poro_list)
    require "pry"; binding.pry
  end
end
