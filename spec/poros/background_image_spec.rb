require 'rails_helper'

describe BackgroundImage do
  it 'initializes with attributes' do
    data = JSON.parse(File.read('spec/fixtures/json/image_data.json'), symbolize_names: true)
    location = 'denver,co'
    background_image = BackgroundImage.new(data, location)
    expect(background_image.id).to be_nil
    expect(background_image.place).to eq('Denver, CO')
    expect(background_image.image_url).to be_a(String)
    expect(background_image.source).to eq('pixabay.com')
    expect(background_image.author).to be_a(String)
  end
end
