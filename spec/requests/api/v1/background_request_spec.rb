require 'rails_helper'

RSpec.describe 'Api::V1::Backgrounds', type: :request do
  describe 'Background request API' do
    it 'can return a background image based on location given' do
      get '/api/v1/backgrounds?location=denver,co'

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json[:data][:attributes][:place]).to eq('Denver, CO')
      expect(json[:data][:attributes][:image_url]).to be_a(String)
      expect(json[:data][:attributes][:source]).to be_a(String)
      expect(json[:data][:attributes][:author]).to be_a(String)
    end
  end
end
