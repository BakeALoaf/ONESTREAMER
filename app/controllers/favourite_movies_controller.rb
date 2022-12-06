class FavouriteMoviesController < ApplicationController
  before_action :set_favourite, only: %i[new create]

  # def new
  #   @favourite_movies = Favourite_movie.new
  # end

  # def create
  #   @favourite_movie = Favourite_movie.new(favourites_param)
  #   @favourite_movie.user_id = current_user
  #   if @favourite_movie.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def edit
    @favourite_movie = Movie.find(params[:id])
  end

  def update
    @favourite_movie = Movie.find(params[:id])
    @favourite_movie.update(movie_params)
    redirect_to root_path
  end

  private

  def favourites_param
    params.require(:favourite_movie).permit(:user_id)
  end

  def movie_params
    params.require(:movie).permit(:name, :description, :image_url, :genre, :age_rating, :platform, :release_date, :imdb_rating, :video_url, :favourite_movie_id)
  end

  def set_favourite
    @favourite_movie = Favourite_movie.find(params[:id])
  end
end
