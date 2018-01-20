class ArtistsController < ApplicationController
	helper_method :invert_order_by

	def index
		@artists = Artist.all.order("#{sort_column} #{sort_direction}")
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def invert_order_by
		sort_direction == "asc" ? "desc" : "asc"
	end

	private

	def artist_params
		params.required(:artist).permit(:name, :style, :image)
	end

	def sort_column
    Artist.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
