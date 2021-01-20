class Api::V1::RoadTripController < ApplicationController

  def create
    data = JSON.parse(request.body.read, symbolize_names: true)

    user = User.find_by(api_key: data[:api_key])
    if !user
      render json: { message: 'Unauthorized' }
    else
    road_trip = RoadTripFacade.get_road_trip(data[:origin], data[:destination])
      render json: RoadTripSerializer.new(road_trip)
    end
  end
end
