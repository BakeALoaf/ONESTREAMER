class FavouriteMoviesController < ApplicationController
  before_action :set_movie, only: %i[new create]

  def index
    @user = current_user
    @favourite_movies = FavouriteMovie.where(user_id: @user)
  end

  def new
    @favourite_movie = FavouriteMovie.new
  end

  def create
    @favourite_movie = FavouriteMovie.new
    @favourite = FavouriteMovie.where(movie_id: @movie).select { |fav| fav.user == current_user }.first
    unless @favourite.nil?
      @favourite.destroy
    else
      @favourite_movie.user = current_user
      @favourite_movie.movie = @movie
      @favourite_movie.save!
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def favourite_params
    params.require(:favourite_movies).permit(:user_id, :movie_id)
  end
end
