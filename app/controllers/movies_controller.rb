class MoviesController < ApplicationController
  def index
    @favourite_movie = FavouriteMovie.new
    @favourite_platforms = current_user.platforms

    if params[:query].present?
      @movies = Movie.where("name ILIKE ?", "%#{params[:query]}%")
    elsif @favourite_platforms.length > 0
      @movies = []
      @favourite_platforms.each do |platform|
        @movies << platform.movies
      end
      @movies.flatten!
      # raise
    else
      @platforms = Platform.all
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
