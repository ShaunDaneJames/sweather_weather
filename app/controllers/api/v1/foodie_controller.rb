class Api::V1::FoodieController < ApplicationController

  def show
    data = FoodieFacade.get_foodie_data(params[:start], params[:end], params[:search])

    render json: FoodieSerializer.new(data)
  end
end
