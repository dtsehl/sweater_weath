class ClimbingRoutesFacade
  def self.generate_route(location)
    coords = MapService.get_coords(location)
    weather_data = WeatherService.get_weather(coords)
    # some other code to get routes from a service
    ClimbingRoute.new(weather_data, location)
  end
end
