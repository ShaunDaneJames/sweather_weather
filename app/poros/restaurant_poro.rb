class RestaurantPoro
  attr_reader :name, :address, :destination, :travel_time_hrs, :weather_poro

  def initialize(restaurant_data, travel_time_hrs, destination, weather_poro)
    @name = restaurant_data[:name]
    @address = restaurant_data[:location][:display_address]
    @destination = destination
    @travel_time_hrs = travel_time_hrs
    @summary = weather_poro[:conditions]
    @temperature = weather_poro[:temp]
  end
end
