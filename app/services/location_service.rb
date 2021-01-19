class LocationService

  def self.get_coordinates(location)
    JSON.parse(LocationService.get_location(location).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
    url: (ENV['MAP_QUEST_URL'].to_s),
    params: { key: (ENV['MAP_QUEST_API_KEY']) }
    )
  end

  def self.get_location(location)
    LocationService.conn.get('/geocoding/v1/address') do |req|
    req.params[:location] = location
    end
  end 
end
