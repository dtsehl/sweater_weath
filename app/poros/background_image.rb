class BackgroundImage
  include Capitalizeable
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
end
