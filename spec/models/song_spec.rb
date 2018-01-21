require 'rails_helper'

RSpec.describe Song, type: :model do
	describe "Validations" do
		let(:artist) { build(:artist) }
		let(:song) { build(:song, artist: artist) }

		it "not valid without a title" do
			song.title = ""
			song.valid?

			expect(song.errors.has_key?(:title)).to eq true
		end

		it "not valid with title > 30 chars" do
			song.title = "a" * 31
			song.valid?

			expect(song.errors.has_key?(:title)).to eq true
		end

		it "not valid with title < 3 chars" do
			song.title = "ab"
			song.valid?

			expect(song.errors.has_key?(:title)).to eq true
		end
	end

	describe "Relations" do
		let(:artist) { create(:artist) }
		let(:song) { create(:song, artist: artist) }

		it "not valid without an artist" do
			song.artist = nil
			song.valid?

			expect(song.errors.has_key?(:artist)).to eq true
		end

		it "must be associated with the correct artist" do
			artist_songs = artist.songs

			expect(artist_songs.include?(song)).to eq true
		end

		it "must be destroyed with the artist" do
			song.valid?
			songs_count = Song.all.count
			artist.destroy

			expect(Song.all.count).to eq (songs_count - 1)
		end
	end
end
