require 'rails_helper'

RSpec.describe 'Api::V1::Routes', type: :request do
  describe 'Climbing Routes request API' do
    it 'can return correct route data' do
      get '/api/v1/climbing_routes?location=erwin,tn'



      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      require "pry"; binding.pry
    end
  end
end
