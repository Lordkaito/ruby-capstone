require 'json'
class SaveGames
  def save(array)
    savings = []
    array.each do |game|
      saving_obj = {
        name: game.name,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        source_info: fetch_source(game)
      }
      savings << saving_obj
    end
    store_tojson(savings)
  end

  def fetch_source(game)
    if game.source
      game.source.name
    else
      false
    end
  end

  def store_tojson(savings)
    File.write('games/games.json', JSON.generate(savings)) unless savings.empty?
  end
end
