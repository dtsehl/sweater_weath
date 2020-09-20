class BackgroundFacade
  def self.generate_background(location)
    background_data = BackgroundImageService.get_background(location)
    BackgroundImage.new(background_data, location)
  end
end
