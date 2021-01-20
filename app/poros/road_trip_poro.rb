class RoadTripPoro
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, travel_time_sec, arrival_forecast)
    @start_city = origin
    @end_city = destination
    @travel_time_sec = travel_time_sec
    @arrival_forecast = arrival_forecast
  end

  def travel_time
    time = Time.at(@travel_time_sec).utc.strftime("%H:%M")
    hrs, mins = time.split(':')
    time = "#{hrs} hrs #{mins} mins"
  end

  def weather_at_eta
    {
      temperature: @arrival_forecast[:hourly][duration_hours][:temp],
      conditions: @arrival_forecast[:hourly][duration_hours][:weather].first[:description],
    }
  end

  def duration_hours
    (@travel_time_sec.to_f / 3600).round
  end
end
