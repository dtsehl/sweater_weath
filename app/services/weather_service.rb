class WeatherService
  def self.get_weather(coords)
    response = conn.get do |f|
      f.params['lat'] = coords[:lat]
      f.params['lon'] = coords[:lng]
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
