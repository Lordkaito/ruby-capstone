require 'json'
require 'pry'

class SaveBooks
  def save(array)
    savings = []
    array.each do |book|
      saving_obj = {
        name: book.name,
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date,
        author_info: fetch_author(book)
      }
      savings << saving_obj
    end
    store_tojson(savings)
  end

  def fetch_author(book)
    return book.author.first_name.to_s, book.author.last_name.to_s if book.author

    false
  end

  def store_tojson(savings)
    File.write('books/books.json', savings.to_json) unless savings.empty?
  end
end
