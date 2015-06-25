class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new, layout: false
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      @user.update(latitude: params[:latitude], longitude: params[:longitude], status: true)
      session[:user_id] = @user.id
      render :json => @user
    else
      render :error, layout: false
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.update(status: false)
    session[:user_id] = nil
    redirect_to root_url
  end
end
