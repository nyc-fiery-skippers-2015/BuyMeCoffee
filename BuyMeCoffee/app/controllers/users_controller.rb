class UsersController < ApplicationController

  def index
    @users = User.online_users
    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.includes(:categories).find(params[:id])
  end

  def card
    @user = User.find(params[:id])
    render @user
  end

  def new
    @user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to user_path(@new_user)
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :about, :pic_loc, :password ,:email, :linkedin )
  end
end
