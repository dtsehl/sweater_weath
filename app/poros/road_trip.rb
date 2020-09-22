class RoadTrip
  attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast

  def initialize(route_data, destination_weather_data, origin, destination)
    @origin = capitalize_location(origin)
    @destination = capitalize_location(destination)
    @travel_time = return_travel_time(route_data)
    @arrival_forecast = return_arrival_forecast(route_data, destination_weather_data)
  end

  private

  def return_travel_time(route_data)
    hours = (route_data[:route][:time] / 60) / 60
    remainder = (route_data[:route][:time] / 60) % 60
    if hours.positive?
      "#{hours} hour(s) #{remainder} minute(s)"
    else
      "#{remainder} minutes"
    end
  end

  def return_arrival_forecast(route_data, destination_weather_data)
    average_hours = ((route_data[:route][:time].to_f / 60) / 60).round
    average_hours -= 1 if average_hours.positive?
    data = destination_weather_data[:hourly][average_hours]
    "#{data[:temp].to_i} deg, #{data[:weather][0][:description].capitalize}"
  end

  def capitalize_location(location)
    split_location = location.split(',')
    split_location[0].capitalize!
    split_location[1].upcase!
    split_location.join(', ')
  end
end
