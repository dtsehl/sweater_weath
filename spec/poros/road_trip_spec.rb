require 'rails_helper'

describe RoadTrip, :vcr do
  it 'initializes with attributes' do
    origin = 'denver,co'
    destination = 'pueblo,co'
    route_data = MapService.get_route_between(origin, destination)
    destination_weather_data = WeatherService.get_destination_forecast(route_data)

    road_trip = RoadTrip.new(route_data, destination_weather_data, origin, destination)

    expect(road_trip.id).to be_nil
    expect(road_trip.origin).to eq('Denver, CO')
    expect(road_trip.destination).to eq('Pueblo, CO')
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.arrival_forecast).to be_a(String)
  end
  it 'still returns correct data if the trip is under 60 minutes' do
    origin = 'denver,co'
    destination = 'aurora,co'
    route_data = MapService.get_route_between(origin, destination)
    destination_weather_data = WeatherService.get_destination_forecast(route_data)

    road_trip = RoadTrip.new(route_data, destination_weather_data, origin, destination)

    expect(road_trip.id).to be_nil
    expect(road_trip.origin).to eq('Denver, CO')
    expect(road_trip.destination).to eq('Aurora, CO')
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.travel_time.include?('hour')).to be_falsey
    expect(road_trip.arrival_forecast).to be_a(String)
  end
end
