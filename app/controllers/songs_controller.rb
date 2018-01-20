class SongsController < ApplicationController
	before_action :load_artist

	def create
		@song = @artist.songs.new(song_params)
		@song.save

		redirect_to(@artist, notice: "Song added successfully")
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy

		redirect_to @artist
	end

	private

	def song_params
		params.require(:song).permit(:title)
	end

	def load_artist
		@artist = Artist.find(params[:artist_id])
	end
end
