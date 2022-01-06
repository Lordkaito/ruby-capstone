require 'date'
class Item
  attr_reader :source, :author, :label, :publish_date, :archived, :name
  attr_accessor :id

  def initialize(name, publish_date)
    @id = rand(1...1000)
    @name = name
    @publish_date = publish_date
    @archived = false
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    DateTime.now.year - Date.parse(@publish_date).year >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
