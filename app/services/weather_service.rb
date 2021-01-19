class WeatherService

  def self.find_weather(location_coordinates)
    JSON.parse(WeatherService.weather_json(location_coordinates).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
    url: (ENV['OPEN_WEATHER_MAP_URL'].to_s),
    params: { appid: (ENV['OPEN_WEATHER_MAP_API_KEY']) }
    )
  end
  
  def self.weather_json(location_coordinates)
    weather_json = conn.get('/data/2.5/onecall') do |req|
      req.params[:lat] = location_coordinates.lat
      req.params[:lon] = location_coordinates.lon
      req.params[:units] = 'imperial'
    end
  end
end
