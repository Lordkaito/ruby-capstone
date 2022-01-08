class ListLabels
  def listing(array)
    if array.length.positive?
      array.each do |label|
        puts '--------------------------'
        puts "Title : #{label.title} | Color : #{label.color}"
        puts "Mucic albums : #{music_album_list(label)}"
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
        arr_music_albums << label.name
      end
      arr_music_albums.join(' | ')
    else
      'N/A'
    end
  end
end
