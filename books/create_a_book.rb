require_relative './book'
require_relative './handle_authors'
class CreateNewBook
  def create_book(name, book_publisher, book_publish_date, book_cover_state)
    title = name
    publisher = book_publisher
    cover_state = book_cover_state
    publish_date = book_publish_date
    Book.new(title, publisher, publish_date, cover_state)
  end
  def ask_info(books, authors)
    system 'clear'
    puts 'Enter the name of the book:'
    book_name = gets.chomp
    puts 'Enter the publisher: '
    book_publisher = gets.chomp
    puts 'Enter the cover state: '
    book_cover_state = gets.chomp
    puts 'Enter the publish date: '
    book_publish_date = gets.chomp
    new_book = create_book(book_name, book_publisher, book_publish_date, book_cover_state)
    books << new_book
    author_choice(new_book, authors)
  end
  def author_choice(book, authors)
    puts 'The book was created successfully !'
    puts 'Would you like to give additional information about its author ? Y | N'
    choice = gets.chomp
    HandleAuthor.new.create(book, authors) if choice.downcase == 'y'
  end
end