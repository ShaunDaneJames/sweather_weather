class WeatherFacade

  def self.get_weather_data(location_coordinates)
    weather_data = WeatherService.find_weather(location_coordinates)

    WeatherPoro.new(weather_data)
  end
end
