class FoodieFacade

  def self.get_foodie_data(start, destination, search)
    travel_time = MapQuestService.get_travel_time(start, destination)

    destination_coordinates = LocationFacade.get_coordinates(destination)

    arrival_forecast = WeatherService.find_weather(destination_coordinates)

    restaurant = FoodieService.get_restaurant(search, destination_coordinates)

    FoodieRestaurantPoro.new(restaurant, arrival_forecast, travel_time)
  end
end
