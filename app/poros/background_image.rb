class BackgroundImage
  attr_reader :id, :place, :image_url, :source, :author

  def initialize(data, location)
    @image_url = data[:webformatURL]
    @source = get_source(data)
    @author = data[:user]
    @place = capitalize_location(location)
  end

  private

  def get_source(data)
    return 'pixabay.com' if data[:pageURL].include?('pixabay')
  end

  def capitalize_location(location)
    split_location = location.split(',')
    split_location[0].capitalize!
    split_location[1].upcase!
    split_location.join(', ')
  end
end
