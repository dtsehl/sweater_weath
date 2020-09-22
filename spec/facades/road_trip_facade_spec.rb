require 'rails_helper'

describe RoadTripFacade, :vcr do
  it 'returns a RoadTrip PORO when generate_road_trip is called' do
    origin = 'denver,co'
    destination = 'pueblo,co'

    road_trip = RoadTripFacade.generate_road_trip(origin, destination)
    expect(road_trip).to be_a(RoadTrip)
  end
end
