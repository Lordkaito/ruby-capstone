require 'json'
require_relative './music_albums/load_music_albums'
require_relative './games/load_games'
require_relative './books/load_books'
class LoadData
  def load(games, sources, books, authors, music_albums, labels)
    LoadGames.new.load_games(games, sources)
    LoadBooks.new.load_books(books, authors)
    LoadMusicAlbums.new.load_music_albums(music_albums, labels)
  end
end
