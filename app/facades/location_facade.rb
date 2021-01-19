class LocationFacade

  def self.get_coordinates(location)
    coordnate_data = LocationService.get_coordinates(location)

    LocationPoro.new(coordnate_data)
  end
end
