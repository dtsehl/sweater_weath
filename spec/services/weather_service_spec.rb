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
end
