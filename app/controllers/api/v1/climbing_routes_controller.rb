class Api::V1::ClimbingRoutesController < ApplicationController
  def show
    render json: ClimbingRoutesSerializer.new(ClimbingRoutesFacade.generate_route(params[:location]))
  end
end
