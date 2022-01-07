require_relative './music_albums/save_music_albums'
require_relative './games/save_games'
require_relative './books/save_books'

class SaveAndExit
  def store(books, music_albums, games)
    SaveGames.new.save(games)
    SaveBooks.new.save(books)
    SaveMusicAlbums.new.save(music_albums)
    puts 'thank you for using this app'
  end
end
