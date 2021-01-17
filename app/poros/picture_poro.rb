class PicturePoro
  attr_reader :picture_url, :location, :source

  def initialize(data, location)
    @picture_url = data[:results].first[:urls][:regular]
    @location = location
    @source = 'unsplash.com'
  end
end
