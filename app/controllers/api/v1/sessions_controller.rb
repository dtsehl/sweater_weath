class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      error = { body: 'Login Credentials Incorrect' }
      render json: error, status: 401
    end
  end
end
