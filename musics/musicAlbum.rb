require_relative "../item"

class MusicAlbum < Item
  # attr_accessor :on_spotify

  def initialize(on_spotify, publish_date = Time.now)
    super(publish_date)
    @on_spotify = on_spotify
  end


end

