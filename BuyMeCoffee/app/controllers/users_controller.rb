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
    render :show, layout: false
  end

  def new
    @user = User.new
    @categories = Category.all
  end

  def create

    @new_user = User.new(user_params)
    @category = Category.find(params[:user][:categories].to_i)
    if @new_user.save
      @new_user.categories << @category
      redirect_to root_url
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:id] == 'pos'
      pos
    else
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        redirect_to edit_user_path
      end
    end
  end

  def pos
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user.update(latitude: params[:latitude], longitude: params[:longitude])
      render :json => @user
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :about, :password ,:email, :linkedin, :skill_list,:latitude, :longitude)
  end
end
