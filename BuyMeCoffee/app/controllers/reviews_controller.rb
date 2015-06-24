class ReviewsController < ApplicationController
  def show
  end

  def new
    @review = Review.new
    render :new, layout: false
  end

  def create
    @user = User.find(params[:user])
    @review = Review.new(rating: params[:rating], author_id: session[:user_id], user_id: params[:user])
    @rating = @user.rating(@user.id)
    if @review.save
      render @user, layout: false
    end
  end
end
