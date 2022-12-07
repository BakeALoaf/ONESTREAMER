class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    @favourite_platform = FavouritePlatform.new
    @user = current_user
  end
end
