class SongsController < ApplicationController
	before_action :set_artist

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

	def set_artist
		@artist = Artist.find(params[:artist_id])
	end
end
