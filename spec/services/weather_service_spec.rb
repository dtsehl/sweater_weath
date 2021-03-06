require 'rails_helper'

RSpec.describe 'Weather Service', :vcr do
  it 'can get the weather from lat/long coordinates' do
    coords = { lat: 39.738453, lng: -104.984853 }
    weather = WeatherService.get_weather(coords)

    expect(weather).to be_a(Hash)
    expect(weather[:current]).to have_key(:sunrise)
    expect(weather[:current]).to have_key(:sunset)
    expect(weather[:current]).to have_key(:temp)
    expect(weather[:current]).to have_key(:pressure)
  end
  it 'can get the weather data of a destination generated by a route' do
    origin = 'denver,co'
    destination = 'pueblo,co'
    route_data = MapService.get_route_between(origin, destination)

    destination_weather_data = WeatherService.get_destination_forecast(route_data)

    expect(destination_weather_data).to be_a(Hash)
    
    expect(destination_weather_data[:current]).to have_key(:sunrise)
    expect(destination_weather_data[:current]).to have_key(:sunset)
    expect(destination_weather_data[:current]).to have_key(:temp)
    expect(destination_weather_data[:current]).to have_key(:pressure)
  end
end
