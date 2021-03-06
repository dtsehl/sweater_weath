class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(ForecastFacade.generate_forecast(params[:location]))
  end
end
