require 'rails_helper'

RSpec.describe Artist, type: :model do
	describe "Validations" do
		let(:artist) { build(:artist) }

		it "not valid without a name" do
			artist.name = ""
			artist.valid?

			expect(artist.errors.has_key?(:name)).to eq true
		end

		it "not valid with name > 40 chars" do
			artist.name = "a" * 41
			artist.valid?

			expect(artist.errors.has_key?(:name)).to eq true
		end

		it "not valid without style" do
			artist.style = ""
			artist.valid?

			expect(artist.errors.has_key?(:style)).to eq true
		end

		it "not valid with style < 3 chars" do
			artist.style = "ab"
			artist.valid?

			expect(artist.errors.has_key?(:style)).to eq true
		end

		it "not valid with style > 20 chars" do
			artist.style = "a" * 21
			artist.valid?

			expect(artist.errors.has_key?(:style)).to eq true
		end
	end

	describe "Relations" do
		let(:artist)       { create(:artist)                     }
		let(:other_artist) { create(:artist)                     }
		let(:song1)        { create(:song, artist: artist)       }
		let(:song2)        { create(:song, artist: artist)       }
		let(:song3)        { create(:song, artist: other_artist) }

		it "must include songs created 'in' artist" do
			expect(artist.songs.include?(song1)).to eq true
			expect(artist.songs.include?(song2)).to eq true
		end

		it "must NOT include songs created 'in' other_artist" do
			expect(artist.songs.include?(song3)).to eq false
		end

		it "must destroy songs with the artist" do
			song1.valid?
			song2.valid?
			songs_count = Song.all.count
			artist_songs_count = artist.songs.count
			artist.destroy

			expect(Song.all.count).to eq songs_count - artist_songs_count
		end
	end
end
