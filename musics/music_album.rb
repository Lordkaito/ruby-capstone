require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(name, on_spotify, publish_date)
    super(name, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super and @on_spotify
  end
end
