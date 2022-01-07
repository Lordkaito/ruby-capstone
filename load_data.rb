require 'json'
require_relative './music_albums/load_music_albums'
require_relative './games/load_games'

# class LoadData
#   def load(music_albums, labels, games, sources)
#     LoadMusicAlbums.new.load_music_albums(music_albums, labels)
#     LoadGames.new.load_games(games, sources)
#   end
# end

class LoadData
  def load_music(music_albums, labels)
    LoadMusicAlbums.new.load_music_albums(music_albums, labels)
  end

  def load(games, sources)
    LoadGames.new.load_games(games, sources)
  end
end