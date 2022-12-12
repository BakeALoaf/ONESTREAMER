class MoviesController < ApplicationController
  def index
    # @top_movies = Movie.all.sample(4)
    @favourite_movie = FavouriteMovie.new
    @favourite_platforms = current_user.platforms
    @random_movies = Movie.all.sample(4)

    if params[:query].present?
      @movies = Movie.where("name ILIKE ?", "%#{params[:query]}%")
    elsif @favourite_platforms.length > 0
      @movies = []
      @favourite_platforms.each do |platform|
        @movies << platform.movies
      end
      @movies.flatten!
    elsif params[:query].present?
      @movies = Movie.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @platforms = Platform.all
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @favourite = FavouriteMovie.where(movie_id: @movie).select { |fav| fav.user == current_user }.first
  end
end
