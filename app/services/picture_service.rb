class PictureService

  def self.find_photo(location)
    JSON.parse(PictureService.location_json(location).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
    url: (ENV['UNSPLASH_URL'].to_s),
    params: { client_id: (ENV['UNSPLASH_ACCESS_KEY']) }
    )
  end

  def self.location_json(location)
    PictureService.conn.get('/search/photos?') do |req|
      req.params[:query] = location
      req.params[:per_page] = 1
    end
  end
end
