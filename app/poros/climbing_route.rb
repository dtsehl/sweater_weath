class ClimbingRoute
  attr_reader :id, :location, :forecast, :routes

  def initialize(routes, location, weather)
    @forecast = prune_weather(weather)
    @routes = prune_routes(routes)
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
    {summary: weather[:current][:weather][0][:description], temperature: weather[:current][:temp].to_i}
  end

  def prune_routes(routes)
    
  end
end
