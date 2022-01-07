require_relative './music_album'

class ListMusicAlbums
  def listing(array)
    puts 'No music_album added yet!' unless array.length.positive?
    array.each do |music_album|
      puts '-------------------------------------------------------------'
      puts "#{array.find_index(music_album) + 1})"
      puts "Name : #{music_album.name} | On_Spotify : #{check_bool_tostr(music_album.on_spotify)}"
      puts "Published : #{music_album.publish_date}"
      print "Archived : #{check_bool_tostr(music_album.archived)} "
      puts "| Archiveable : #{check_bool_tostr(music_album.can_be_archived?)}"
      puts "Label/Creator : #{check_src(music_album)}"
      puts '-------------------------------------------------------------'
    end
  end

  def check_bool_tostr(value)
    return 'Yes' if value == true

    'No'
  end

  def check_src(music_album)
    if music_album.label
      music_album.label.title.to_s
    else
      'N/A'
    end
  end
end
