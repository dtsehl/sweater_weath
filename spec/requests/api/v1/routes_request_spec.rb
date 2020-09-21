require 'rails_helper'

RSpec.describe 'Api::V1::Routes', type: :request do
  describe 'Climbing Routes request API', :vcr do
    it 'can return correct route data' do
      get '/api/v1/climbing_routes?location=erwin,tn'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json[:data][:id]).to be_nil
      expect(json[:data][:type]).to eq('climbing_routes')
      expect(json[:data][:attributes][:location]).to eq('Erwin, TN')
      expect(json[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(json[:data][:attributes][:forecast][:temperature]).to be_a(Integer)
      expect(json[:data][:attributes][:routes][0][:name]).to be_a(String)
      expect(json[:data][:attributes][:routes][0][:type]).to be_a(String)
      expect(json[:data][:attributes][:routes][0][:rating]).to be_a(Float)
      expect(json[:data][:attributes][:routes][0][:location][0]).to be_a(String)
      expect(json[:data][:attributes][:routes][0][:distance_to_route]).to be_a(Float)
    end
  end
end
