require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'User Registration API' do
    it 'can create a user with a POST request' do
      incorrect_user = create(:user)
      # User.create!(email: 'false@false.com', password: 'false', password_confirmation: 'false')
      user_info = {
        email: 'user@user.com',
        password: 'password',
        password_confirmation: 'password'
      }

      post  '/api/v1/users',
            params: user_info.to_json,
            headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }

      expect(response).to be_successful
      expect(response).to have_http_status(201)

      json = JSON.parse(response.body, symbolize_names: true)

      user = User.last

      expect(json[:data][:type]).to eq('users')
      expect(json[:data][:id].to_i).to eq(user.id)
      expect(json[:data][:attributes][:email]).to eq(user.email)
      expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
      expect(user.password).to be_nil

      expect(json[:data][:attributes][:email]).to_not eq(incorrect_user.email)
      expect(json[:data][:attributes][:api_key]).to_not eq(incorrect_user.api_key)
    end
    it 'returns a 400 status code and error message if registration was unsuccessful' do
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
  describe 'User Login API' do
    it 'can let a user login' do
      incorrect_user = create(:user)
      user_info = {
        email: 'user@user.com',
        password: 'password',
        password_confirmation: 'password'
      }
      User.create(user_info)

      post '/api/v1/sessions',
           params: user_info.to_json,
           headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }

      user = User.last

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
      expect(json[:data][:attributes][:email]).to eq(user.email)

      expect(json[:data][:attributes][:api_key]).to_not eq(incorrect_user.api_key)
      expect(json[:data][:attributes][:email]).to_not eq(incorrect_user.email)
    end
    it 'will return a 400 status and error message if credentials are incorrect' do
      create(:user)
      user_info = {
        email: 'user@user.com',
        password: 'password',
        password_confirmation: 'password'
      }

      post '/api/v1/sessions',
           params: user_info.to_json,
           headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' }

      expect(response).to have_http_status(401)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:body]).to eq('Login Credentials Incorrect')
    end
  end
end
