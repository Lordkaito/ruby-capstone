class App
  def initialize
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
  end
end
