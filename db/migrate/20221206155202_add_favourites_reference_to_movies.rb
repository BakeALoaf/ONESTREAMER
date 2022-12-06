class AddFavouritesReferenceToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :favourite_movie
  end
end
