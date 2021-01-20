class Api::V1::FoodieController < ApplicationController

  def show
    FoodieFacade.get_foodie_data(params[:start], params[:end], params[:search])
  end
end
