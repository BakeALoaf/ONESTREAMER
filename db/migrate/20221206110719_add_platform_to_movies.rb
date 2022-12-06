class AddPlatformToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :platform, :string
  end
end
