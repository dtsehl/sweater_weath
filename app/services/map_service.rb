class MapService
  def self.get_coords(location)
    response = conn.get 'geocoding/v1/address' do |f|
      f.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.get_route_between(origin, destination)
    response = conn.get 'directions/v2/route' do |f|
      f.params['from'] = origin
      f.params['to'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['MAP_KEY']
    end
  end
end
