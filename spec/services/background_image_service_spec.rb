require 'rails_helper'

RSpec.describe 'Background Image Service' do
  it 'can get a background image based on a query' do
    location = 'denver,co'
    background = BackgroundImageService.get_background(location)

    expect(background).to be_a(Hash)
    expect(background[:id]).to be_a(Integer)
    expect(background[:pageURL]).to be_a(String)
  end
end
