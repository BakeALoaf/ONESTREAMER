class AddBannerUrlToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :banner_url, :string
  end
end
