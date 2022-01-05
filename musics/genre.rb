class Genre
  attr_reader :items
  attr_accessor :name, :id

  def initialize()

  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

