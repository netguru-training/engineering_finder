class ReviewsController < ApplicationController
  require 'application_helper'

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
    redirect to category_thesis_path(category, thesis)
  end

  def update
    redirect_to category_thesis_path(category, thesis)
  end

  def delete
    redirect_to category_thesis_path(category, thesis) unless current_user.is_admin?
  end

  private
  def review_params
    params.require(:review).permit(:content, :product)
  end
end
