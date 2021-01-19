class Api::V1::ForecastController < ApplicationController

  def index
    location_coordinates = LocationFacade.get_coordinates(params[:location])

    weather_poro = WeatherFacade.get_weather_data(location_coordinates)

    render json: WeatherSerializer.new(weather_poro).serializable_hash.to_json
  end
end
