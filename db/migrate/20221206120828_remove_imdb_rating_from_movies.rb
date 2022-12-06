class RemoveImdbRatingFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :imdb_rating, :decimal
  end
end
