require_relative './books/create_a_book'
require_relative './books/list_all_books'
require_relative './books/list_all_authors'
require_relative './games/add_game'
require_relative './games/list_games'
require_relative './games/list_sources'

class App
  attr_accessor :list_of_games, :list_of_sources

  def initialize
    @list_of_books = []
    @list_of_authors = []
    @list_of_games = []
    @list_of_sources = []
    @selection = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List of games',
      '4' => 'List all sources',
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
    case choice
    when '1' then list_all_books # isai
    when '2' then list_all_music_albums # ben
    when '3' then list_all_games # amin
    when '4' then list_sources # amin
    when '5' then list_labels # ben
    when '6' then list_authors # isai
    when '7' then create_book # isai
    when '8' then add_music_album # ben
    when '9' then add_game # amin
    when '10' then exit # needs to be replaced with some storing function
    else
      puts 'Invalid selection'
      start
    end
  end

  def create_book
    system 'clear'
    CreateNewBook.new.ask_info(@list_of_books, @list_of_authors)
    start
  end

  def list_all_books
    system 'clear'
    ListAllBooks.new.list_books(@list_of_books)
    start
  end

  def list_authors
    system 'clear'
    ListAllAuthors.new.list_authors(@list_of_authors)
    start
  end

  def add_game
    AddGame.new.adding(@list_of_games, @list_of_sources)
    start
  end

  def list_all_games
    ListGames.new.listing(@list_of_games)
    start
  end

  def list_sources
    ListSources.new.listing(@list_of_sources)
    start
  end
end
