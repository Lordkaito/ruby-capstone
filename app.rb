require_relative './books/create_a_book'
require_relative './books/list_all_books'
require_relative './books/list_all_authors'
require_relative './games/add_game'
require_relative './games/list_games'
require_relative './games/list_sources'
require_relative './music_albums/add_music_album'
require_relative './music_albums/list_music_albums'
require_relative './music_albums/list_labels'
require_relative './save_and_exit'
require_relative './load_data'

class App
  attr_accessor :list_of_games, :list_of_sources

  def initialize()
    @list_of_books = []
    @list_of_authors = []
    @list_of_games = []
    @list_of_sources = []
    @list_music_albums = []
    @list_of_labels = []

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

  def load
    LoadData.new.load(@list_of_games, @list_of_sources, @list_of_books, @list_of_authors)
    start
  end

  def start
    puts "Welcome to the Catalog of my things\n"
    puts 'Select by entering a number.'
    @selection.each { |key, value| puts "\t #{key}) #{value}" }
    choice = gets.chomp
    case choice
    when '1' then list_all_books
    when '2' then list_all_music_albums
    when '3' then list_all_games
    when '4' then list_sources
    when '5' then list_labels
    when '6' then list_authors
    when '7' then create_book
    when '8' then add_music_album
    when '9' then add_game
    when '10' then SaveAndExit.new.store(@list_of_books, @list_music_albums, @list_of_games)
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

  def add_music_album
    AddMusicAlbum.new.adding(@list_music_albums, @list_of_labels)
    start
  end

  def list_all_music_albums
    ListMusicAlbums.new.listing(@list_music_albums)
    start
  end

  def list_labels
    ListLabels.new.listing(@list_of_labels)
    start
  end
end
