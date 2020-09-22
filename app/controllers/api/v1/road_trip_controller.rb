class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      render json: RoadTripSerializer.new(RoadTripFacade.generate_road_trip(params[:origin], params[:destination]))
    else
      body = { body: 'API key invalid or not given' }
      render json: body, status: 401
    end
  end
end
