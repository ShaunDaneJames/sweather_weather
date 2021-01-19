class YelpFacade

  def self.find_restaurants(destination, cuisine)
    YelpService.find_restaurants(destination, cuisine)
  end
end
