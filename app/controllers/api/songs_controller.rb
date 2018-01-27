class Api::SongsController < Api::BaseController
  before_action :set_artist, except: [:create, :destroy]

  def destroy_artist_songs
    Song.destroy_all(artist: @artist) if !@artist.nil?
    render_response(200, message: "Songs destroyed")
  end

  def index
    @songs = @artist.songs
    render_response(200, @songs)
  end

  def create
		@song = @artist.songs.new(song_params)

    if @song.save
      render_response(201, @song)
    else
      render_errors(422, @song.errors)
    end
	end

	def destroy
		@song = Song.find(params[:id])
		if @song.destroy
      render_response(200, message: "Song destroyed")
    else
      render_errors(422, @song.errors)
    end
	end

	private

	def song_params
		params.require(:song).permit(:title)
	end

	def set_artist
		@artist = Artist.find(params[:artist_id])
	end
end
