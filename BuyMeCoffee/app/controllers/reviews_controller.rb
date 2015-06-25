class ReviewsController < ApplicationController
  def show
  end

  def new
    if session[:user_id]
      @review = Review.new
      render :new, layout: false
    else
      render :'landing_page/error', layout: false
    end
  end

  def create
    if session[:user_id]
      @user = User.find(params[:user])
      @review = Review.new(rating: params[:rating], author_id: session[:user_id], mentor_id: params[:user])
      @rating = @user.rating
      if @review.save
        render :json => {rating: @user.rating, id: @user.id }
      else
        render :error, layout: false
      end
    else
      render :'landing_page/error', layout: false
    end
  end
end
