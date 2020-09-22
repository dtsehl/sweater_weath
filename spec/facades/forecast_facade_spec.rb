require 'rails_helper'

describe ForecastFacade, :vcr do
  it 'returns a Forecast PORO when generate_forecast is called' do
    location = 'denver,co'
    forecast = ForecastFacade.generate_forecast(location)
    expect(forecast).to be_a(Forecast)
  end
end
