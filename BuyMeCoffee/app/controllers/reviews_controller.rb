class ReviewsController < ApplicationController
  def show
  end

  def new
    @review = Review.new
    render :new, layout: false
  end

  def create
    @review = Review.new(rating: params[:rating], author_id: session[:user_id], user_id: params[:user])
    if @review.save
      render :show
    end
  end
end
