class LocationFacade

  def self.get_coordinates(location)
    coordnate_data = LocationService.get_coordinates(location)

    LocationPoro.new(coordnate_data)
  end

  def self.travel_time(origin, destination)
    LocationService.get_travel_time(origin, destination)
  end
end
