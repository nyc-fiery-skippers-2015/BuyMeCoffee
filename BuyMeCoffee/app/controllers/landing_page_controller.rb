class LandingPageController < ApplicationController
 def index
  @users = User.online_users.page(params[:page]).per_page(4)
 end


end
