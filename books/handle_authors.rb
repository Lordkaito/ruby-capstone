require_relative './author'
class HandleAuthor
  def create(book, authors)
    if authors.length.positive?
      exists(book, authors)
    else
      doesnt_exist(book, authors)
    end
  end

  def show_authors(authors)
    authors.each do |author|
      puts "#{authors.find_index(author) + 1} ) #{author.name}"
    end
  end

  def exists(book, authors)
    show_authors(authors)
    puts 'Which author ? Any other input will give you the ability to create a new author'
    selection = gets.chomp.to_i
    if (1..authors.length).include?(selection)
      book.add_author(authors[selection - 1])
      puts "#{book.name} added to #{authors[selection - 1].name} successfully"
    else
      doesnt_exist(book, authors)
    end
  end

  def doesnt_exist(book, authors)
    if authors.length.positive?
      puts 'Invalid Selection, would you like to create a new author ? [ Y | N ]'
    else
      puts 'There are no authors added yet, Would you like to create one ? [ Y | N ]'
    end
    selection = gets.chomp.downcase
    if selection == 'y'
      create_author(book, authors)
    else
      puts 'book was created successfully, but was not assigned to any author :('
    end
  end

  def create_author(book, authors)
    puts 'Insert the author name'
    first_name = gets.chomp
    puts 'Insert the author last name'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    authors << new_author
    new_author.add_item(book)
    puts "#{book.name} added to #{first_name} successfully"
  end
end
