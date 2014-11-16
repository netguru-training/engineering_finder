class ReviewsController < ApplicationController
  require 'application_helper'

  expose :reviews
  expose(:review, attributes: :review_params)
  expose :user

  def new
    review = Review.new()
    add_breadcrumb "Add review", new_category_thesis_review_path(category, thesis)
  end

  def create
    review = Review.new(review_params)
    review.user = current_user
    review.product = product
  end

  def edit
    redirect to product_path(review_params[:product])
    add_breadcrumb "Edit review", edit_category_thesis_review_path(category, thesis)
  end

  def update
    redirect_to product_path(review_params[:product])
  end

  def delete
    redirect_to product_path(review_params[:product]) unless current_user.is_admin?
  end

  private
  def review_params
    params.require(:review).permit(:content, :product)
  end
end
