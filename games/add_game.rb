require 'date'
require_relative './game'
class AddGame
  def adding(array)
    puts 'Insert a name for the game'
    name = gets.chomp
    puts 'Is your game multiplayer ? [Y | N]'
    multiplayer = gets.chomp
    multiplayer = case multiplayer.downcase
                  when 'y'
                    true
                  else
                    false
                  end
    puts 'Insert last played date in this format YYYY-MM-DD'
    last_date = gets.chomp.to_s
    until date_checker(last_date)
      puts "Incorrect date format, #{last_date} is not valid YYYY-MM-DD date"
      last_date = gets.chomp.to_s
    end
    puts 'Insert publish date in this format YYYY-MM-DD'
    publish_date = gets.chomp.to_s
    until date_checker(publish_date)
      puts "Incorrect date format, #{publish_date} is not valid YYYY-MM-DD date"
      publish_date = gets.chomp.to_s
    end
    array << Game.new(name, multiplayer, last_date, publish_date)
    source_choice
  end

  def date_checker(date)
    format = '%Y-%m-%d'
    DateTime.strptime(date, format)
    true
  rescue ArgumentError
    false
  end

  def source_choice
    puts 'The game was created successfully !'
    puts 'Would you like to give additional information about its source ? Y | N'
    choice = gets.chomp
    handle_source if choice.downcase == 'y'
  end
end
