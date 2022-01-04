class Item
  attr_reader :genre, :author, :label
  attr_accessor :id, :archived

  def initialize(publish_date: Time.now)
    @id = rand(1...1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label(label)
    @lable = lable
    lable.items << self unless lable.items.include?(self)
  end

  def can_be_archived?
    Time.now.year - @publish_date >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
