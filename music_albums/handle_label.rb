require_relative './label'
class HandleLabel
  def create(music_album, labels)
    if labels.length.positive?
      exists(music_album, labels)
    else
      doesnt_exist(music_album, labels)
    end
  end

  def show_labels(labels)
    labels.each do |label|
      puts "#{labels.find_index(label) + 1} ) #{label.title}, #{label.color}"
    end
  end

  def exists(music_album, labels)
    show_labels(labels)
    puts 'Which label ? Any other input will give you the ability to create a new label'
    selection = gets.chomp.to_i
    if (1..labels.length).include?(selection)
      music_album.add_label(labels[selection - 1])
      puts "#{music_album.name} added to #{labels[selection - 1].title} successfully"
    else
      doesnt_exist(music_album, labels)
    end
  end

  def doesnt_exist(music_album, labels)

    puts "level 4"
    if labels.length.positive?
      puts 'Invalid Selection, would you like to create a new label ? [ Y | N ]'
    else
      puts 'There are no labels added yet, Would you like to create one ? [ Y | N ]'
    end
    selection = gets.chomp.downcase
    create_label(music_album, labels) if selection == 'y'
    puts 'Music_album was created successfully, but was not assigned to any label :('
  end

  def create_label(music_album, labels)
    puts 'Insert the label Title:'
    title = gets.chomp
    puts 'Insert the label Color:'
    color = gets.chomp
    new_label = Label.new(title, color)
    labels << new_label
    new_label.add_item(music_album)
    puts "#{music_album.name} added to #{title} successfully"
  end
end
