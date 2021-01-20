class RoadTripFacade

  def self.get_road_trip(origin, destination)
    travel_time = MapQuestService.get_travel_time(origin, destination)

    destination_coordinates = LocationFacade.get_coordinates(destination)

    arrival_forecast = WeatherService.find_weather(destination_coordinates)

    RoadTripPoro.new(origin, destination, travel_time, arrival_forecast)
  end
end
