class YelpService

  def self.find_restaurants(destination, cuisine, eta)
    restaurant_data = conn.get('/v3/businesses/search') do |req|
      req.params[:location] = destination
      req.params[:term] = cuisine
      req.params[:open_at] = eta
    end

    JSON.parse(restaurant_data.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
    url: (ENV['YELP_URL'].to_s),
    headers: { Authorization: "Bearer #{(ENV['YELP_API_KEY'])}" }
    )
  end
end
