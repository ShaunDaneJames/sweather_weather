class Api::V1::BackgroundsController < ApplicationController

  def index
    picture_poro = PictureFacade.bg_photo(params[:location])

    render json: PictureSerializer.new(picture_poro).serializable_hash.to_json
  end
end
