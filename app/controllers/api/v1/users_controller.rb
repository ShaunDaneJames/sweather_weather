class Api::V1::UsersController < ApplicationController

  def create
    user_params = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_or_create(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: { message: 'unsuccessful', error: 'Could not find or create user' }
    end
  end
end
