class RestaurantPoro
  attr_reader :destination_city, :travel_time, :forecast, :restaurant

  def initialize(restaurant_data, travel_time_hrs, destination, current_weather)
    @name = restaurant_data[:name]
    @address = restaurant_data[:location][:display_address]
    @destination_city = destination
    @travel_time_hrs = travel_time_hrs
    @current_weather = current_weather
  end

  def restaurant
    restaurant = {
      name: @name,
      address: @address
    }
  end

  def forecast
    @current_weather = {
      summary: [:condtions],
      temperature: [:temp]
    }
  end
end
