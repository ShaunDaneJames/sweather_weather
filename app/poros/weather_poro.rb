class WeatherPoro
  attr_reader :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @data = data
    @daily_data = data[:daily].first(5)
    @hourly_data = data[:hourly].first(8)
  end

  def current_weather
    current_weather = {
      datetime: Time.at(@data[:current][:dt]),
      sunrise: Time.at(@data[:current][:sunrise]),
      sunset: Time.at(@data[:current][:sunset]),
      temp: @data[:current][:temp],
      feels_like: @data[:current][:feels_like],
      humidity: @data[:current][:humidity],
      uvi: @data[:current][:uvi],
      visibility: @data[:current][:visibility],
      conditions: @data[:current][:weather].first[:description],
      icon: @data[:current][:weather].first[:icon]
    }
  end

  def daily_weather
    daily = @daily_data.map do |data|
      {
        date: Time.at(data[:dt]),
        sunrise: Time.at(data[:sunrise]),
        sunset: Time.at(data[:sunset]),
        max_temp: (data[:temp][:max]),
        min_temp: (data[:temp][:min]),
        conditions: data[:weather].first[:description],
        icon: data[:weather].first[:icon]
      }
    end
  end

  def hourly_weather
    hourly = @hourly_data.map do |data|
      {
        time: Time.at(data[:dt]),
        temp: (data[:temp]),
        wind_speed: data[:wind_speed],
        wind_direction: data[:wind_deg],
        conditions: data[:weather].first[:description],
        icon: data[:weather].first[:icon]
      }
    end
  end

  def convert_K_to_F(temp)
    ((temp - 273.15) * 9/5 + 32).round(1)
  end
end
