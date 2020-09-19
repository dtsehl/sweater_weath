class ForecastFacade
  def self.generate_forecast(location)
    coords = MapService.get_coords(location)
    weather_data = WeatherService.get_weather(coords)
    Forecast.new(weather_data, location)
  end
end
