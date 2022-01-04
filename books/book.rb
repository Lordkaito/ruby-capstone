require_relative "../item"

class Book
  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @archived = true if @publisher.can_be_archived? || @cover_state == "bad"
  end

  
end
blabla = Book.new('herlo', 'good')