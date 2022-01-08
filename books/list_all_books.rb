require_relative './book'

class ListAllBooks
  def list_books(books)
    puts 'No books added yet!' unless books.length.positive?
    books.each do |book|
      puts '-------------------------------------------------------------'
      puts "#{books.find_index(book) + 1})"
      puts "ID: #{book.id}"
      puts "Name: #{book.name}"
      puts "Published: #{book.publish_date}"
      puts "Publisher: #{book.publisher}"
      puts "Archived: #{check_bool_tostr(book.archived)}"
      puts '-------------------------------------------------------------'
    end
  end

  def check_bool_tostr(value)
    return 'Yes' if value == true

    'No'
  end
end
