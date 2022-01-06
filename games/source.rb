class Source
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_source(self)
  end
end
