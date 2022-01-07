require_relative './games/save_games'
require_relative './books/save_books'

class SaveAndExit
  def store(books, _music, games)
    SaveGames.new.save(games)
    SaveBooks.new.save(books)
    puts 'thank you for using this app'
  end
end
