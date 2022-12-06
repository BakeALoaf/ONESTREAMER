class RemoveReleaseDateFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :release_date, :date
  end
end
