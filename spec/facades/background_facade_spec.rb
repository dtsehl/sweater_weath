require 'rails_helper'

describe BackgroundFacade, :vcr do
  it 'returns a BackgroundImage PORO when generate_background is called' do
    location = 'denver,co'
    background_image = BackgroundFacade.generate_background(location)
    expect(background_image).to be_a(BackgroundImage)
  end
end
