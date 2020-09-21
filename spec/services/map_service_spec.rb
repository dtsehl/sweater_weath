require 'rails_helper'

RSpec.describe 'Map Service', :vcr do
  it 'can get lat/long of a location' do
    location = MapService.get_coords('denver,co')
    expect(location).to be_a(Hash)

    expect(location[:lat]).to eq(39.738453)
    expect(location[:lng]).to eq(-104.984853)

    location = MapService.get_coords('chicago,il')

    expect(location[:lat]).to eq(41.883229)
    expect(location[:lng]).to eq(-87.632398)
  end
  it 'can get the distance between two lat/long coordinates' do
    starting_coords = { lat: 39.738453, lng: -104.984853 }
    ending_coords = { lat: 39.9312, lng: -105.2852 }
    distance_between = MapService.get_distance_between(starting_coords, ending_coords)

    expect(distance_between).to be_a(Float)
  end
end
