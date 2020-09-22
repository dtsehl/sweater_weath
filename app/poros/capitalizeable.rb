module Capitalizeable
  def capitalize_location(location)
    split_location = location.split(',')
    split_location[0].capitalize!
    split_location[1].upcase!
    split_location.join(', ')
  end
end
