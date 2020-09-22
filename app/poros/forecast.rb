class Forecast
  include Capitalizeable
  attr_reader :id, :timezone, :current, :daily, :hourly, :place

  def initialize(data, location)
    current = prune_current(data[:current])
    daily = prune_daily(data[:daily])
    hourly = prune_hourly(data[:hourly])
    @timezone = data[:timezone]
    @current = current
    @daily = daily
    @hourly = hourly
    @place = capitalize_location(location)
  end

  private

  def prune_current(data)
    data.without(:pressure, :dew_point, :clouds, :wind_speed, :wind_deg)
  end

  def prune_daily(data)
    data.map! do |day|
      day.without(:feels_like, :pressure, :humidity, :dew_point, :wind_speed, :wind_deg, :clouds, :pop, :uvi)
    end
  end

  def prune_hourly(data)
    data.map! do |hour|
      hour.without(:feels_like, :pressure, :humidity, :dew_point, :clouds, :visibility, :wind_speed, :wind_deg, :pop)
    end
  end
end
