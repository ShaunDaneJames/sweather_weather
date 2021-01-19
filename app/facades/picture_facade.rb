class PictureFacade

  def self.bg_photo(location)
    picture_data = PictureService.find_photo(location)

    PicturePoro.new(picture_data, location)
  end
end
