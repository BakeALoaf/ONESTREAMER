class AddImdbUrlToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :imdb_url, :string
  end
end
