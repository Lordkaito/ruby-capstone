require 'json'

class SaveMusicAlbums
  def save(array)
    savings = []
    array.each do |music_album|
      saving_obj = {
        name: music_album.name,
        on_spotify: music_album.on_spotify,
        publish_date: music_album.publish_date,
        label_info: fetch_label(music_album)
      }
      savings << saving_obj
    end
    store_tojson(savings)
  end

  def fetch_label(music_album)
    if music_album.label
      music_album.label.title
      # music_album.label.color
    else
      false
    end
  end

  def store_tojson(savings)
    File.write('music_albums/music_albums.json', JSON.generate(savings)) unless savings.empty?
  end
end
