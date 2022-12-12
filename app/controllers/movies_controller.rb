class MoviesController < ApplicationController
  def index
    # @top_movies = Movie.all.sample(4)
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
      @random_movies = Movie.all.sample(4)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
