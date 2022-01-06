require_relative './games/save_games'
class SaveAndExit
  def store(_books, _music, games)
    SaveGames.new.save(games)
    puts 'thank you for using this app'
  end
end
