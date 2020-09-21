require 'rails_helper'

RSpec.describe 'Routes Service' do
  it 'can get routes nearby from lat/long coordinates', :vcr do
    coords = { lat: 39.738453, lng: -104.984853 }
    routes = ClimbingRoutesService.get_routes(coords)

    expect(routes).to be_a(Hash)
    expect(routes[:routes]).to be_a(Array)
    expect(routes[:routes][0]).to have_key(:id)
    expect(routes[:routes][0]).to have_key(:name)
    expect(routes[:routes][0]).to have_key(:type)
    expect(routes[:routes][0]).to have_key(:location)
    expect(routes[:routes][0][:name]).to be_a(String)
    expect(routes[:routes][0][:id]).to be_a(Integer)
    expect(routes[:routes][0][:location]).to be_a(Array)
  end
end
