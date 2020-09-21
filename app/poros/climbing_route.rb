class ClimbingRoute
  attr_reader :id, :location, :forecast, :routes

  def initialize(routes, location, weather, starting_coords)
    @forecast = prune_weather(weather)
    @routes = prune_routes(routes, starting_coords)
    @location = capitalize_location(location)
  end

  private

  def capitalize_location(location)
    split_location = location.split(',')
    split_location[0].capitalize!
    split_location[1].upcase!
    split_location.join(', ')
  end

  def prune_weather(weather)
    { summary: weather[:current][:weather][0][:description], temperature: weather[:current][:temp].to_i }
  end

  def prune_routes(routes, starting_coords)
    all_routes = []
    routes[:routes].each do |route|
      ending_coords = { lat: route[:latitude], lng: route[:longitude] }
      all_routes << { name: route[:name], type: route[:type], rating: route[:stars], location: route[:location], distance_to_route: MapService.get_distance_between(starting_coords, ending_coords) }
    end
    all_routes
  end
end
