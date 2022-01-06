class ListSources
  def listing(array)
    if array.length.positive?
      array.each do |source|
        puts '--------------------------'
        puts source.name.to_s
        puts "Games : #{game_list(source)}"
        puts '--------------------------'
      end
    else
      puts 'No sources added yet!'
    end
  end

  def game_list(source)
    arr_of_games = []
    if source.items.length.positive?
      source.items.each do |game|
        arr_of_games << game.name
      end
      arr_of_games.join(' | ')
    else
      'N/A'
    end
  end
end
