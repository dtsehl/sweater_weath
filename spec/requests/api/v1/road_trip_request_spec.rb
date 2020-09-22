require 'rails_helper'

RSpec.describe 'Api::V1::RoadTrip', type: :request do
  describe 'Road Trip API' do
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

      require "pry"; binding.pry

      # user = User.last
      #
      # expect(json[:data][:type]).to eq('users')
      # expect(json[:data][:id].to_i).to eq(user.id)
      # expect(json[:data][:attributes][:email]).to eq(user.email)
      # expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
      # expect(user.password).to be_nil
      #
      # expect(json[:data][:attributes][:email]).to_not eq(incorrect_user.email)
      # expect(json[:data][:attributes][:api_key]).to_not eq(incorrect_user.api_key)
    end
    xit 'returns a 401 status code if an error occurs' do
      user_info = {
        email: 'user@user.com'
      }

      post  '/api/v1/users',
            params: user_info.to_json,
            headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }

      expect(response).to have_http_status(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:body]).to eq("Password digest can't be blank and Password can't be blank")
    end
  end
end
