require_relative './music_albums/save_music_albums'
require_relative './games/save_games'

class SaveAndExit
  def store(_books, music_albums, games)
    SaveMusicAlbums.new.save(music_albums)
    SaveGames.new.save(games)
    puts 'thank you for using this app'
  end
end
