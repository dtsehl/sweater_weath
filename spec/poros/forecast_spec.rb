require 'rails_helper'

describe Forecast do
  it 'initializes with attributes' do
    data = JSON.parse(File.read('spec/fixtures/json/weather_data.json'), symbolize_names: true)
    location = 'denver,co'
    forecast = Forecast.new(data, location)
    expect(forecast.id).to be_nil
    expect(forecast.timezone).to eq(data[:timezone])
    expect(forecast.current[:temp]).to eq(data[:current][:temp])
    expect(forecast.daily[0][:temp][:min]).to eq(data[:daily][0][:temp][:min])
    expect(forecast.hourly[0][:dt]).to eq(data[:hourly][0][:dt])
  end
  it 'only has the attributes required by the given wireframe' do
    data = JSON.parse(File.read('spec/fixtures/json/weather_data.json'), symbolize_names: true)
    location = 'denver,co'
    forecast = Forecast.new(data, location)
    expect(forecast.current[:clouds]).to_not eq(data[:current][:clouds])
    expect(forecast.daily[0][:clouds]).to be_nil
    expect(forecast.hourly[0][:clouds]).to be_nil
    expect(forecast.place).to eq('Denver, CO')
  end
end
