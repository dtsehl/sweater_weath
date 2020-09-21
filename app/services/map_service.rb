class MapService
  def self.get_coords(location)
    response = conn.get 'geocoding/v1/address' do |f|
      f.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.get_distance_between(coords)
    response = conn.get 'directions/v2/route' do |f|
      f.params['from'] = coords[0]
      f.params['to'] = coords[1]
    end
    JSON.parse(response.body, symbolize_names: true)[:route][:distance]
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['MAP_KEY']
    end
  end
end
