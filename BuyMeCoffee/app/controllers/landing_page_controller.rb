class LandingPageController < ApplicationController
 def index

  @user = User.new
  @categories = Category.all
  @users = User.online_users.page(params[:page]).per_page(5)
  @invitations = Invitation.any_invites?(session[:user_id])
 end


end
