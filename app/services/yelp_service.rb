class YelpService

  def self.find_restaurants(destination, cuisine)
    conn.get('/v3/businesses/search') do |req|
      req.params[:location] = destination
      req.params[:term] = cuisine
    end 
  end

  def conn
    Faraday.new(
    url: (ENV['YELP_URL'].to_s),
    params: { bearer: (ENV['YELP_API_KEY']) }
    )
  end
end
