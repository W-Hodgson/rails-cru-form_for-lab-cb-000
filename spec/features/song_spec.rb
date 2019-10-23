require 'rails_helper'

describe 'navigate song pages' do
  before do
    @artist = Artist.create(name: "My Artist", bio: "My artist bio")
    @genre = Genre.create(name: "My Genre")
    @song = Song.create(name: "My Song", artist_id: @artist.id, genre_id: @genre.id)
  end

  it 'shows the name on the show page in a h1 tag' do
    visit song_path(@song.id)
    expect(page).to have_css("h1", text: "My Song")
  end

  it 'displays a link to the genre page' do
    visit song_path(@song.id)

    expect(page).to have_link(@genre.name, href: genre_path(@genre))
  end

  it 'displays a link to the artist page' do
    visit song_path(@song.id)

    expect(page).to have_link(@artist.name, href: artist_path(@artist))
  end

  it 'to song pages' do
    visit song_path(@song.id)
    expect(page.status_code).to eq(200)
  end
end

describe 'song form' do
  before do
    @artist = Artist.create(name: "My Artist", bio: "My artist bio")
    @genre = Genre.create(name: "My Genre")
  end
end

describe 'song index' do
  before do
    @artist = Artist.create(name: "My Artist", bio: "My artist bio")
    @genre = Genre.create(name: "My Genre")
    @song = Song.create(name: "My Song", artist_id: @artist.id, genre_id: @genre.id)
  end

  it 'displays the song name' do
    visit songs_path
    expect(page).to have_css("p", text: "My Song")
  end


end
