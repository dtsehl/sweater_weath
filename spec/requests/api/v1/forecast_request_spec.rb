require 'rails_helper'

RSpec.describe 'Api::V1::Forecasts', type: :request do
  describe 'Forecast request API', :vcr do
    it 'can return forecast data' do
      get '/api/v1/forecast?location=denver,co'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json[:data][:attributes]).to have_key(:id)
      expect(json[:data][:attributes][:timezone]).to be_a(String)
      expect(json[:data][:attributes][:current][:sunrise]).to be_a(Integer)
      expect(json[:data][:attributes][:current][:sunset]).to be_a(Integer)
      expect(json[:data][:attributes][:current][:temp]).to be_a(Float)
      expect(json[:data][:attributes][:current][:weather][0][:description]).to be_a(String)
      expect(json[:data][:attributes][:place]).to eq('Denver, CO')
      expect(json[:data][:attributes][:daily][0][:feels_like]).to be_nil
      expect(json[:data][:attributes][:daily][0][:visibility]).to be_nil
      expect(json[:data][:attributes][:hourly][0][:visibility]).to be_nil
      expect(json[:data][:attributes][:hourly][0][:wind_speed]).to be_nil
    end
  end
end
