class MoviesController < ApplicationController
  def index
    if
      params[:query].present?
      @movies = Movie.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
      @favourite_movie = FavouriteMovie.new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
