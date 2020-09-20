class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :place, :image_url, :source, :author
end
