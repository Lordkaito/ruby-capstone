require_relative '../games/game'
require_relative '../games/source'

describe Game do
  before :each do
    @rockstar = Author.new('rockstar', 'inc')
    @gta = Game.new('GTA', true, '2018-11-10', '2007-11-10')
    @rockstar.add_item(@gta)
  end

  it 'shows instance of Game class' do
    expect(@gta).to be_instance_of Game
  end

  it 'shows instance of Author class' do
    expect(@rockstar).to be_instance_of Source
  end

  it 'is multiplayer ?' do
    expect(@gta.multiplayer).to match true
  end

  it 'adds gta to rockstar' do
    expect(@rockstar.items.length).to match 1
    expect(@rockstar.items).to include @gta
  end

  it 'does not add again the same instance' do
    @prev_size = @rockstar.items.length
    @rockstar.add_item(@gta)
    expect(@rockstar.items.length).to match @prev_size
  end
end
