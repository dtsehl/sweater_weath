class ClimbingRoutesFacade
  def self.generate_route(location)
    coords = MapService.get_coords(location)
    weather_data = WeatherService.get_weather(coords)
    routes = ClimbingRoutesService.get_routes(coords)
    ClimbingRoute.new(weather_data, location, routes)
  end
end
