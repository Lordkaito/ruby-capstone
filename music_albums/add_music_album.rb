require 'date'
require_relative './music_album'
require_relative './handle_label'

class AddMusicAlbum
  def adding(array, labels)
    puts 'Insert a name for the music_album'
    name = gets.chomp
    puts 'Is your music_album on_spotify ? [Y | N]'
    on_spotify = gets.chomp
    on_spotify = case on_spotify.downcase
                  when 'y'
                    true
                  else
                    false
                  end

    puts 'Insert publish date in this format YYYY-MM-DD'
    publish_date = gets.chomp.to_s
    until date_checker(publish_date)
      puts "Incorrect date format, #{publish_date} is not valid YYYY-MM-DD date"
      publish_date = gets.chomp.to_s
    end
    new_music_album = MusicAlbum.new(name, on_spotify, publish_date)
    array << new_music_album
    label_choice(new_music_album, labels)
  end

  def date_checker(date)
    format = '%Y-%m-%d'
    DateTime.strptime(date, format)
    true
  rescue ArgumentError
    false
  end

  def label_choice(new_music_album, labels)
    puts 'The game was created successfully !'
    puts 'Would you like to give additional information about its source ? Y | N'
    choice = gets.chomp
    HandleLabel.new.create(new_music_album, labels) if choice.downcase == 'y'
  end
end
