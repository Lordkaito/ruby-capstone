require_relative '../books/book'
require_relative '../books/author'

describe Book do
  before :each do
    @my_author = Author.new('JK', 'Rowling')
    @harry = Book.new('HP', 'Bloomsbury', 'good')
    @my_author.add_item(@harry)
  end

  it 'shows instance of Book class' do
    expect(@harry).to be_instance_of Book
  end

  it 'shows instance of Source class' do
    expect(@my_author).to be_instance_of Author
  end

  it 'is good cover state' do
    expect(@harry.cover_state).to match 'good'
  end

  it 'adds harry to my_author' do
    expect(@my_author.items.length).to match 1
    expect(@my_author.items).to include @harry
  end

  it 'does not add again the same instance' do
    @prev_size = @my_author.items.length
    @my_author.add_item(@harry)
    expect(@my_author.items.length).to match @prev_size
  end
end
