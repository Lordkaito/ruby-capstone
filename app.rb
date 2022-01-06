require_relative './books/create_a_book'
require_relative './musics/create_music_album'
require 'pry'

class App
  def initialize
    @list_of_books = []
    @create_new_book = CreateNewBook.new(@list_of_books)
    @selection = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List of games',
      '4' => 'List all genres',
      '5' => 'List all labels',
      '6' => 'List all authors',
      '7' => 'Add a book',
      '8' => 'Add a music album',
      '9' => 'Add a game',
      '10' => 'Exit'
    }
  end

  def start
    puts "Welcome to the Catalog of my things\n"
    puts 'Select by entering a number.'
    @selection.each { |key, value| puts "\t #{key}) #{value}" }
    choice = gets.chomp
    puts(choice)
    case choice
    when '1' then list_all_books # isai
    when '2' then list_all_music_albums # ben
    when '3' then list_all_games # amin
    when '4' then list_source # amin
    when '5' then list_labels # ben
    when '6' then list_authors # isai
    when '7' then @create_new_book.ask_info # isai
    when '8' then create_music_album # ben
    when '9' then add_game # amin
    when '10' then exit # needs to be replaced with some storing function
    else
      puts 'Invalid selection'
      start
    end
  end
end
