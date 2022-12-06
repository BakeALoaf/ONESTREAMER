class RemovePlatformUrlFromPlatforms < ActiveRecord::Migration[7.0]
  def change
    remove_column :platforms, :platform_url, :string
  end
end
