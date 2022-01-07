require 'pry'
class LoadBooks
  def load_books(books, authors)
    file = './books/data/books.json'
    recreate_books(books, authors, file) if File.exist? file
  end

  def recreate_books(books, authors, file)
    used_authors = []
    json_file = File.read(file)
    JSON.parse(json_file).each do |book|
      new_book = Book.new(book['name'], book['publisher'], book['publish_date'], book['cover_state'])
      books << new_book
      author?(book['author_info'], new_book, authors, used_authors) if book['author_info']
    end
  end

  def author?(new_auth, new_book, authors, used_authors)
    found = used_authors.select { |author| author if author[:auth_name] == new_auth }
    if found.length.positive?
      found[0][:auth_obj].add_item(new_book)
    else
      author = Author.new(new_auth[0], new_auth[1])
      used_authors << { auth_name: new_auth, auth_obj: author }
      author.add_item(new_book)
      authors << author
    end
  end
end
