class DropFavouriteMovies < ActiveRecord::Migration[7.0]
  def change
    drop_table :favourite_movies
  end
end
