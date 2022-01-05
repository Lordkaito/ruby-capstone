require_relative './book'

class CreateNewBook
  def initialize(books)
    @books = books
  end

  def create_book(book_publisher, book_cover_state)
    publisher = book_publisher
    cover_state = book_cover_state
    @books << Book.new(publisher, cover_state)
  end

  def ask_info
    system 'clear'
    print 'Enter the publisher: '
    book_publisher = gets.chomp
    print 'Enter the cover state: '
    book_cover_state = gets.chomp
    create_book(book_publisher, book_cover_state)
  end
end
