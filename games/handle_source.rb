require_relative './source'
require 'pry'
class HandleSource
  def create(game, sources)
    if sources.length.positive?
      exists(game, sources)
    else
      doesnt_exist(game, sources)
    end
  end

  def show_sources(sources)
    sources.each do |source|
      puts "#{sources.find_index(source) + 1} ) #{source.name}"
    end
  end

  def exists(game, sources)
    show_sources(sources)
    puts 'Which source ? Any other input will give you the ability to create a new source'
    selection = gets.chomp.to_i
    if (1..sources.length).include?(selection)
      game.add_source(sources[selection - 1])
      puts "#{game.name} added to #{sources[selection - 1].name} successfully"
    else
      doesnt_exist(game, sources)
    end
  end

  def doesnt_exist(game, sources)
    if sources.length.positive?
      puts 'Invalid Selection, would you like to create a new source ? [ Y | N ]'
    else
      puts 'There are no sources added yet, Would you like to create one ? [ Y | N ]'
    end
    selection = gets.chomp.downcase
    if selection == 'y'
      create_source(game, sources)
    else
      puts 'Game was created successfully, but was not assigned to any source :('
    end
  end

  def create_source(game, sources)
    puts 'Insert the source name'
    name = gets.chomp
    new_source = Source.new(name)
    sources << new_source
    new_source.add_item(game)
    puts "#{game.name} added to #{name} successfully"
  end
end
