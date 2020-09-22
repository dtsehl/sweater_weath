class MapService
  def self.get_coords(location)
    response = conn.get 'geocoding/v1/address' do |f|
      f.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['MAP_KEY']
    end
  end
end
