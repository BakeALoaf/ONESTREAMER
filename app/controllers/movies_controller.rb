class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @favourite_movie = FavouriteMovie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
