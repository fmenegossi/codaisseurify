require 'rails_helper'

feature 'Manage Songs', js: true do
  before(:each){ get_artist_page }

  scenario 'Add a song' do
    add_song("Song1")

    expect(page).to have_content("Song1")
  end

  scenario 'Delete a song' do
    add_song
    add_song
    add_song

    song = @artist.songs.first

    expect(page).to have_content(song.title)
    click_on(song.id)
    expect(page).not_to have_content(song.title)
  end

  scenario 'Delete all songs' do
    song1 = add_song
    song2 = add_song

    expect(page).to have_content(song1)
    expect(page).to have_content(song2)
    click_on('delete-all-songs')
    expect(page).not_to have_content(song2)
    expect(page).not_to have_content(song1)
  end
end

def get_artist_page
  @artist = Artist.create!(name: "Artist name", style: "Style name")
  visit artist_path(@artist)
end

def add_song(title = nil)
  title ||= ('a'..'z').to_a.shuffle[0,10].join

  fill_in('song-title', with: title)
  click_on('Save')

  title
end
