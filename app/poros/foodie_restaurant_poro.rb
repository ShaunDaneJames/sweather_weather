class FoodieRestaurantPoro
  attr_reader :end_location, :travel_time, :forecast, :restaurant

  def initialize(restaurant, arrival_forecast, travel_time)
    @restaurant = restaurant
    @arrival_forecast = arrival_forecast
    @travel_time = travel_time
  end

  def end_location
    @restaurant[:restaurant][:location][:city]
  end

  def travel_time
    time = Time.at(@travel_time).utc.strftime("%H:%M")
    hrs, mins = time.split(':')
    time = "#{hrs} hrs #{mins} mins"
  end

  def forecast
    {
      temperature: @arrival_forecast[:hourly][duration_hours][:temp],
      conditions: @arrival_forecast[:hourly][duration_hours][:weather].first[:description],
    }
  end

  def duration_hours
    (@travel_time_sec.to_f / 3600).round
  end

  def restaurant
    {
      name: @restaurant[:restaurant][:name],
      address: @restaurant[:restaurant][:location][:address]
    }
  end
end
