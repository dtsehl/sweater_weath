class WeatherService
  def self.get_weather(coords)
    response = conn.get do |f|
      f.params['lat'] = coords[:lat]
      f.params['lon'] = coords[:lng]
      f.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_destination_forecast(route_data)
    response = conn.get do |f|
      f.params['lat'] = route_data[:route][:locations].last[:latLng][:lat]
      f.params['lon'] = route_data[:route][:locations].last[:latLng][:lng]
      f.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall') do |f|
      f.params['APPID'] = ENV['WEATHER_KEY']
    end
  end
end
