class ArtistsController < ApplicationController

	def index
		@artists = Artist.all
	end

	def show
		@artist = Artist.find(params[:id])
	end

	private

	def artist_params
		params.required(:artist).permit(:name, :style, :image)
	end
end
