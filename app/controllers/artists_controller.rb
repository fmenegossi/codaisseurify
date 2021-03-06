class ArtistsController < ApplicationController
	before_action :load_artist, only:[:show, :edit, :update, :destroy]
	helper_method :invert_order_by

	def index
		@artists = Artist.all.order("#{sort_column} #{sort_direction}")
	end

	def show;	end

	def edit;	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)

		if @artist.save
			@artist.image = image_params
			@artist.save

			redirect_to artists_path
		else
			render 'new'
		end
	end

	def update
		if @artist.update(artist_params)
			@artist.image = image_params
			@artist.save

			redirect_to @artist
		else
			render 'edit'
		end
	end

	def destroy
		@artist.destroy
		redirect_to artists_path
	end

	def invert_order_by
		sort_direction == "asc" ? "desc" : "asc"
	end

	private

	def image_params
		params[:image].present? ? params[:image] : []
	end

	def load_artist
		@artist = Artist.find(params[:id])
	end

	def artist_params
		params.require(:artist).permit(:name, :style, :images)
	end

	def sort_column
    Artist.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
