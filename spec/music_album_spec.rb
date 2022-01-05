require_relative '../musics/music_album'
require_relative '../musics/label'

describe MusicAlbum do
  before :each do
    @rockstar = Label.new('rockstar', 'inc')
    @gta = MusicAlbum.new(true, '2018-11-10', '2007-11-10')
    @rockstar.add_item(@gta)
  end

  it 'shows instance of MusicAlbum class' do
    expect(@gta).to be_instance_of MusicAlbum
  end

  # it 'shows instance of Label class' do
  #   expect(@rockstar).to be_instance_of Label
  # end

  # it 'is multiplayer ?' do
  #   expect(@gta.multiplayer).to match true
  # end

  # it 'adds gta to rockstar' do
  #   expect(@rockstar.items.length).to match 1
  #   expect(@rockstar.items).to include @gta
  # end

  # it 'does not add again the same instance' do
  #   @prev_size = @rockstar.items.length
  #   @rockstar.add_item(@gta)
  #   expect(@rockstar.items.length).to match @prev_size
  # end
end
