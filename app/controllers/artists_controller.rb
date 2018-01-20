class ArtistsController < ApplicationController
	before_action :load_artist
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
			redirect_to artists_path
		else
			render 'new'
		end
	end

	def update
		if @artist.update(artist_params)
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

	def load_artist
		if params.has_key?("id")
			@artist = Artist.find(params[:id])
		end
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
