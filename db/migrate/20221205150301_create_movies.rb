class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.decimal :imdb_rating
      t.string :image_url
      t.date :release_date
      t.string :genre
      t.integer :age_rating

      t.timestamps
    end
  end
end
