require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date

  def initialize(name, publisher, publish_date, cover_state)
    super(name, publish_date)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

isai = Book.new('Isai', 'Penguin', '19-05-2018', 'good')
isai.can_be_archived?