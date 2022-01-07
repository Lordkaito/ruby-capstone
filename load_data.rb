require 'json'
require_relative './games/load_games'
require_relative './books/load_books'
class LoadData
  def load(games, sources, books, authors)
    LoadGames.new.load_games(games, sources)
    LoadBooks.new.load_books(books, authors)
  end
end
