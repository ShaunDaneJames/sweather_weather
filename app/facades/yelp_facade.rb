class YelpFacade

  def self.find_restaurants(destination, cuisine, travel_time)
    YelpService.find_restaurants(destination, cuisine, travel_time)
  end
end
