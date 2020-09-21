class ClimbingRoutesService
  def self.get_routes(coords)
    response = conn.get 'get-routes-for-lat-lon' do |f|
      f.params['lat'] = coords[:lat]
      f.params['lon'] = coords[:lng]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://www.mountainproject.com/data') do |f|
      f.params['key'] = ENV['ROUTES_KEY']
    end
  end
end
