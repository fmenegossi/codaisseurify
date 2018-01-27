class Api::ArtistsController < Api::BaseController
  before_action :set_artist, except: [:index, :create]

  def index
    render_response(200, Artist.all)
  end

  def show
    render_response(200, @artist)
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render_response(201, @artist)
    else
      render_errors(422, @artist.errors)
    end
  end

  def update
    if @artist.update(artist_params)
      render_response(200, @artist)
    else
      render_errors(422, @artist.errors)
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
    @artist.nil? ? render_errors(404, ["artist not found"]) : @artist
  end

  def artist_params
    params.require(:artist).permit(:name, :style)
  end
end
