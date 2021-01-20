class FoodieService

  def self.get_restaurant(search, destination_coordinates)
    json = conn.get("/api/v2.1/search?lat=#{destination_coordinates.lat}&lon=#{destination_coordinates.lon}&q=#{search}")

    (JSON.parse(json.body, symbolize_names: true)[:restaurants].first)
  end

  def self.conn
    Faraday.new(
      url: (ENV['ZOMATO_URL'].to_s),
      headers: { 'user-key' => (ENV['ZOMATO_API_KEY']) }
    )
  end
end
