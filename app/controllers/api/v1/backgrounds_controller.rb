class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackgroundSerializer.new(BackgroundFacade.generate_background(params[:location]))
  end
end
