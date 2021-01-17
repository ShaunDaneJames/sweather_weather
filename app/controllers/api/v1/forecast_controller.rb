class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]


    conn = Faraday.new(
      url: (ENV['MAP_QUEST_URL'].to_s),
      params: { key: (ENV['MAP_QUEST_API_KEY']) }
    )

    location_json = conn.get('/geocoding/v1/address') do |req|
      req.params[:location] = location
    end

    location_data = JSON.parse(location_json.body, symbolize_names: true)
    location_coordinates = LocationPoro.new(location_data)


    #Call out to open weather api with lat and lng

    conn = Faraday.new(
      url: (ENV['OPEN_WEATHER_MAP_URL'].to_s),
      params: { appid: (ENV['OPEN_WEATHER_MAP_API_KEY']) }
    )

    weather_json = conn.get('/data/2.5/onecall') do |req|
      req.params[:lat] = location_coordinates.lat
      req.params[:lon] = location_coordinates.lon
      req.params[:units] = 'imperial'
    end

    weather_data = JSON.parse(weather_json.body, symbolize_names: true)


    #turn weather_data into poro and serialize for the FE

    weather_poro = WeatherPoro.new(weather_data)

    render json: WeatherSerializer.new(weather_poro).serializable_hash.to_json
  end
end
