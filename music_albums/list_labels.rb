class ListLabels
  puts '0'
  def listing(array)
    if array.length.positive?
      array.each do |label|
        puts '--------------------------'
        puts label.title.to_s
        puts "Mucic_albums : #{music_album_list(label)}"
        puts label.color.to_s
        puts '--------------------------'
      end
    else
      puts 'No labels added yet!'
    end
  end

  def music_album_list(labels)
    arr_music_albums = []
    if labels.items.length.positive?
      labels.items.each do |label|
        arr_music_albums << label.title
        arr_music_albums << label.color
      end
      arr_music_albums.join(' | ')
    else
      'N/A'
    end
  end
end
