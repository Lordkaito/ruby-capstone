require_relative './author'

class ListAllAuthors
  def list_authors(authors)
    puts 'No authors added yet!' unless authors.length.positive?
    authors.each do |author|
      puts '-------------------------------------------------------------'
      puts "#{authors.find_index(author) + 1})"
      puts "ID: #{author.id}"
      puts "Name: #{author.first_name} #{author.last_name}"
      puts "Books: #{author.items.length}"
      puts '-------------------------------------------------------------'
    end
  end
end
