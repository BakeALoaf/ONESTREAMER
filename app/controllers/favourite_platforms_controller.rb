class FavouritePlatformsController < ApplicationController
  def create
    current_user.platforms.destroy_all
    params[:platform]&.each do |platform|
      platform_record = Platform.find_by(name: platform)
      FavouritePlatform.create!(user: current_user, platform: platform_record)
    end
    redirect_to movies_path
  end
end
