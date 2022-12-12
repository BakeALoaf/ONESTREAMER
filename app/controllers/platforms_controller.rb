class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
    @favourite_platforms = current_user.platforms
    @user = current_user
  end
end
