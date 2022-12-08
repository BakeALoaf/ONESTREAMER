class MoviesController < ApplicationController
  def index
    if params[:platform]
      @movies = []
      params[:platform].each do |platform_param|
        platform = Platform.find_by(name: platform_param)
        @movies << platform.movies
      end
      @movies.flatten!
    else
      @platforms = Platform.all
      @movies = Movie.all
    end

    if
      params[:query].present?
      @movies = Movie.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Movie.all
      @favourite_movie = FavouriteMovie.new
    end


    @favourite_movie = FavouriteMovie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end
end




