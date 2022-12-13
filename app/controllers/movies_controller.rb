class MoviesController < ApplicationController
  def index
    @favourite_movie = FavouriteMovie.new
    @favourite_platforms = current_user.platforms
    @random_movies = Movie.all.sample(4)

    if params[:query].present?
      if @favourite_platforms.length > 0
        @movies = []
        sql_query = <<~SQL
          movies.name ILIKE :query
          AND platform ILIKE :favourite_name
        SQL
        @favourite_platforms.each do |platform|
          @movies << Movie.where(sql_query, query: "%#{params[:query]}%", favourite_name: "%#{platform.name}")
        end
        @movies.flatten!
      else
        @movies = Movie.where("name ILIKE ?", "%#{params[:query]}%")
      end
    elsif @favourite_platforms.length > 0
      @movies = []
      @favourite_platforms.each do |platform|
        @movies << platform.movies
      end
      @movies.flatten!
      @random_movies = @movies.sample(4)
    else
      @platforms = Platform.all
      @movies = Movie.all
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'movies/list', locals: { movies: @movies }, formats: [:html] }
    end

  end

  def show
    @movie = Movie.find(params[:id])
    @favourite = FavouriteMovie.where(movie_id: @movie).select { |fav| fav.user == current_user }.first
  end
end
