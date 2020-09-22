class RoadTripFacade
  def self.generate_road_trip(origin, destination)
      route_data = MapService.get_route_between(origin, destination)
      destination_weather_data = WeatherService.get_destination_forecast(route_data)
      RoadTrip.new(route_data, destination_weather_data)
  end
end
