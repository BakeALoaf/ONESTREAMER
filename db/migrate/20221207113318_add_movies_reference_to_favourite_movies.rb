class AddMoviesReferenceToFavouriteMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :favourite_movies, :movie, null: false, foreign_key: true
  end
end
