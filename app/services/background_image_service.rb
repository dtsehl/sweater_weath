class BackgroundImageService
  def self.get_background(location)
    city = location.split(',')[0]
    response = Faraday.get 'https://pixabay.com/api/' do |f|
      f.params['key'] = ENV['IMAGE_KEY']
      f.params['q'] = city
    end
    JSON.parse(response.body, symbolize_names: true)[:hits][0]
  end
end
