require 'pry'
require_relative './game'
require_relative './item'
class Author
  attr_accessor :first_name, :last_name, :id, :items

  def initialize(first_name, last_name)
    @id = rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.add_author(self)
  end
end
