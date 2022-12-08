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


    @favourite_movie = FavouriteMovie.new

  end

  def show
    @movie = Movie.find(params[:id])
  end
end

