class MoviesController < ApplicationController
  def index
    @favourite_movie = FavouriteMovie.new

    if params[:platform]
      @movies = []
      params[:platform].each do |platform_param|
        platform = Platform.find_by(name: platform_param)
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
