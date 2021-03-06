require_relative './game'
class ListGames
  def listing(array)
    puts 'No games added yet!' unless array.length.positive?
    array.each do |game|
      puts '-------------------------------------------------------------'
      puts "#{array.find_index(game) + 1})"
      puts "Name : #{game.name} | Multiplayer : #{check_bool_tostr(game.multiplayer)}"
      puts "Published : #{game.publish_date} | Last played : #{game.last_played_at}"
      puts "Archived : #{check_bool_tostr(game.archived)} | Archiveable : #{check_bool_tostr(game.can_be_archived?)}"
      puts "Source/Creator : #{check_src(game)}"
      puts '-------------------------------------------------------------'
    end
  end

  def check_bool_tostr(value)
    return 'Yes' if value == true

    'No'
  end

  def check_src(game)
    if game.source
      game.source.name.to_s
    else
      'N/A'
    end
  end
end
