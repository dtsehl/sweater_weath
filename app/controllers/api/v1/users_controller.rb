class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      error = { body: user.errors.full_messages.to_sentence }
      render json: error, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
