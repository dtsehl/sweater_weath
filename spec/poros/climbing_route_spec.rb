require 'rails_helper'

describe ClimbingRoute do
  it 'initializes with attributes', :vcr do
    coords = { lat: 39.738453, lng: -104.984853 }
    data = ClimbingRoutesService.get_routes(coords)
    location = 'denver,co'
    weather = WeatherService.get_weather(coords)
    climbing_route = ClimbingRoute.new(data, location, weather, coords)

    expect(climbing_route.id).to be_nil
    expect(climbing_route.location).to be_a(String)
    expect(climbing_route.forecast).to be_a(Hash)
    expect(climbing_route.forecast[:summary]).to be_a(String)
    expect(climbing_route.forecast[:temperature]).to be_a(Integer)
    expect(climbing_route.routes).to be_a(Array)
    expect(climbing_route.routes[0][:name]).to be_a(String)
    expect(climbing_route.routes[0][:type]).to be_a(String)
    expect(climbing_route.routes[0][:rating]).to be_a(Float)
    expect(climbing_route.routes[0][:distance_to_route]).to be_a(Float)
    expect(climbing_route.routes[0][:location]).to be_a(Array)
    expect(climbing_route.routes[0][:location][0]).to be_a(String)
  end
end
