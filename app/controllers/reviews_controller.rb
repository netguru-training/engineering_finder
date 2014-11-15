class ReviewsController < ApplicationController
  expose :reviews
  expose(:review, attributes: :review_params)
  expose :user

  def new
    review = Review.new()
  end

  def create
    review = Review.new(review_params)
    review.user = current_user
    review.product = product
  end

  def edit
    redirect to product_path(review_params[:product])
  end

  def update
    redirect_to product_path(review_params[:product])
  end

  def delete

  end

  private
  def review_params
    params.require(:review).permit(:content, :product)
  end
end
