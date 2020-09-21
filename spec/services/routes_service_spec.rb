require 'rails_helper'

RSpec.describe 'Routes Service' do
  it 'can get routes nearby from lat/long coordinates' do
    coords = { lat: 39.738453, lng: -104.984853 }
    routes = ClimbingRoutesService.get_routes(coords)

    expect(routes).to be_a(Hash)
    require "pry"; binding.pry
    # 
  end
end
