class Api::V1::BackgroundsController < ApplicationController

  def index
    location = params[:location]

    conn = Faraday.new(
      url: (ENV['UNSPLASH_URL'].to_s),
      params: { client_id: (ENV['UNSPLASH_ACCESS_KEY']) }
    )

    location_json = conn.get('/search/photos?') do |req|
      req.params[:query] = location
      req.params[:per_page] = 1
    end

    picture_data = JSON.parse(location_json.body, symbolize_names: true)

    picture_poro = PicturePoro.new(picture_data, location)

    render json: PictureSerializer.new(picture_poro).serializable_hash.to_json

  end
end
