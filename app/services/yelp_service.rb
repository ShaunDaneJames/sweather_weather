class YelpService

  def self.find_restaurants(destination, cuisine, eta)
    restaurant_data = conn.get('/v3/businesses/search') do |req|
      req.params[:location] = destination
      req.params[:term] = cuisine
      req.params[:open_at] = eta
    end

    restaurant_list = JSON.parse(restaurant_data.body, symbolize_names: true)

    YelpService.get_open_restaurants_at_eta(restaurant_list, travel_time)
  end

  def self.conn
    Faraday.new(
    url: (ENV['YELP_URL'].to_s),
    headers: { Authorization: "Bearer #{(ENV['YELP_API_KEY'])}" }
    )
  end

  def self.get_open_restaurants_at_eta(restaurant_list, travel_time)
    require "pry"; binding.pry

    restaurant_list.find_all do |restaurant|
      require "pry"; binding.pry
    end
  end
end
