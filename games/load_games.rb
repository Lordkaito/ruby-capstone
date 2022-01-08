class LoadGames
  def load_games(games, sources)
    file = './games/games.json'
    recreate_games(games, sources, file) if File.exist? file
  end

  def recreate_games(games, sources, file)
    used_sources = []
    JSON.parse(File.read(file)).each do |game|
      new_game = Game.new(game['name'], game['multiplayer'], game['last_played_at'], game['publish_date'])
      games << new_game
      source?(game['source_info'], new_game, sources, used_sources) if game['source_info']
    end
  end

  def source?(new_src_name, new_game, sources, used_sources)
    found = used_sources.select { |element| element if element[:src_name] == new_src_name }
    if found.length.positive?
      found[0][:src_obj].add_item(new_game)
    else
      source = Source.new(new_src_name)
      used_sources << { src_name: new_src_name, src_obj: source }
      source.add_item(new_game)
      sources << source
    end
  end
end
