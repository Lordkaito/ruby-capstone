require_relative '../musics/music_album'
require_relative '../musics/label'

describe MusicAlbum do
  before :each do
    @mysic = Label.new('Gospel', 'Red')
    @release = MusicAlbum.new('Song', true, '2007-11-10')
    @mysic.add_item(@release)
  end

  it 'shows instance of MusicAlbum class' do
    expect(@release).to be_instance_of MusicAlbum
  end

  it 'shows instance of Label class' do
    expect(@mysic).to be_instance_of Label
  end

  it 'is on_spotify ?' do
    expect(@release.on_spotify).to match true
  end

  it 'adds release to mysic' do
    expect(@mysic.items.length).to match 1
    expect(@mysic.items).to include @release
  end

  it 'does not add again the same instance' do
    @prev_size = @mysic.items.length
    @mysic.add_item(@release)
    expect(@mysic.items.length).to match @prev_size
  end
end
