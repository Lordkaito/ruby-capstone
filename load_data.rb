require 'json'
require_relative './games/load_games'
class LoadData
  def load(games, sources)
    LoadGames.new.load_games(games, sources)
  end
end
