class Label
  attr_accessor :title, :color
  attr_reader :items

  def initalize(title, color)
    @id = rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end
end
