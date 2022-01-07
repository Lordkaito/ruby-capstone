class LoadMusicAlbums
  def load_music_albums(music_albums, labels)
    file = './music_albums/music_albums.json'
    recreate_music_albums(music_albums, labels, file) if File.exist? file
  end

  def recreate_music_albums(music_albums, labels, file)
    used_labels = []
    JSON.parse(File.read(file)).each do |music_album|
      new_music_album = MusicAlbum.new(music_album['name'], music_album['on_spotify'], music_album['publish_date'])
      music_albums << new_music_album
      label?(music_album['label_info'], new_music_album, labels, used_labels) if music_album['label_info']
    end
  end

  def label?(new_src_name, new_music_album, labels, used_labels)
    found = used_labels.select { |element| element if element[:src_name] == new_src_name }
    if found.length.positive?
      found[0][:src_obj].add_item(new_music_album)
    else
      label = Label.new(new_src_name[0], new_src_name[1])
      used_labels << { src_name: new_src_name, src_obj: label }
      label.add_item(new_music_album)
      labels << label
    end
  end
end
