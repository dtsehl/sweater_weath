require 'rails_helper'

RSpec.describe 'Api::V1::RoadTrip', type: :request do
  describe 'Road Trip API', :vcr do
    it 'can create a road trip with valid a POST request' do
      user = create(:user)
      road_trip_info = {
        origin: 'denver,co',
        destination: 'pueblo,co',
        api_key: user.api_key
      }

      post  '/api/v1/road_trip',
            params: road_trip_info.to_json,
            headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:type]).to eq('road_trip')
      expect(json[:data][:attributes][:origin]).to eq('Denver, CO')
      expect(json[:data][:attributes][:destination]).to eq('Pueblo, CO')
      expect(json[:data][:attributes][:travel_time]).to be_a(String)
      expect(json[:data][:attributes][:arrival_forecast]).to be_a(String)
    end
    it 'returns a 401 status code if api key is missing' do
      road_trip_info = {
        origin: 'denver,co',
        destination: 'pueblo,co'
      }

      post  '/api/v1/road_trip',
            params: road_trip_info.to_json,
            headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }

      expect(response).to have_http_status(401)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:body]).to eq('API key invalid or not given')
    end
    it 'returns a 401 status code if api key is invalid' do
      road_trip_info = {
        origin: 'denver,co',
        destination: 'pueblo,co',
        api_key: 'not_an_api_key'
      }

      post  '/api/v1/road_trip',
            params: road_trip_info.to_json,
            headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }

      expect(response).to have_http_status(401)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:body]).to eq('API key invalid or not given')
    end
  end
end
