class MapService
  def self.get_coords(location)
    response = conn.get 'geocoding/v1/address' do |f|
      f.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.get_distance_between(starting_coords, ending_coords)
    starting_coords = starting_coords[:lat].to_s + ',' + starting_coords[:lng].to_s
    ending_coords = ending_coords[:lat].to_s + ',' + ending_coords[:lng].to_s
    response = conn.get 'directions/v2/route' do |f|
      f.params['from'] = starting_coords
      f.params['to'] = ending_coords
    end
    JSON.parse(response.body, symbolize_names: true)[:route][:distance]
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['MAP_KEY']
    end
  end
end
