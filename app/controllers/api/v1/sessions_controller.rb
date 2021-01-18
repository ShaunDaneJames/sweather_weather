class Api::V1::SessionsController < ApplicationController

  def create
    user_params = JSON.parse(request.body.read, symbolize_names: true)
    user = User
              .find_by(email: user_params[:email])
              .try(:authenticate, user_params[:password])

    if user
      session[:user_id] = user.id
      render json: SessionSerializer.new(user)
    else
      render json: { message: 'unsuccessful', error: 'Something went wrong' }
    end
  end
end
