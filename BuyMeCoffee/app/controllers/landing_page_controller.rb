class LandingPageController < ApplicationController
 def index

  @user = User.new
  @categories = Category.all
  @users = User.online_users.page(params[:page]).per_page(1)
 end


end
