class MoviesController < ApplicationController
  def index
    @movies = Movies.all
  end

end
