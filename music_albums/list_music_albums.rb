require_relative './music_album'
require 'pry'

class ListMusicAlbums
  def listing(array)
    puts 'No music_album added yet!' unless array.length.positive?
    array.each do |music_album|
      puts '-------------------------------------------------------------'
      puts "#{array.find_index(music_album) + 1})"
      puts "Name : #{music_album.name} | On_Spotify : #{check_bool_tostr(music_album.on_spotify)}"
      puts "Published : #{music_album.publish_date}"
      puts "Archived : #{check_bool_tostr(music_album.archived)} | Archiveable : #{check_bool_tostr(music_album.can_be_archived?)}"
      puts "Label/Creator : #{check_src(music_album)}"
      puts '-------------------------------------------------------------'
      # binding.pry
      # puts "Label/Creator22 : #{check_src(music_album[0])}"
    end
  end

  def check_bool_tostr(value)
    return 'Yes' if value == true

    'No'
  end

  def check_src(music_album)
    if music_album.label
      music_album.label.color.to_s
      music_album.label.title.to_s
    else
      'N/A'
    end
  end
end
