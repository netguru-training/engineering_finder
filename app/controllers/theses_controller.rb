class ThesesController < ApplicationController
  expose :theses
  expose(:thesis, attributes: :thesis_params)
  expose :user

  def index
    add_breadcrumb "Theses", category_theses_path(category)
  end

  def show
    add_breadcrumb "Thesis", category_thesis_path(category, thesis)
  end

  def new
    thesis = Thesis.new()
    add_breadcrumb "Add thesis", new_category_thesis_path(category)
  end

  def create
    thesis = Thesis.new(thesis_params)
    thesis.user_id = current_user.id
    thesis.save()
    redirect_to root_path
  end

  def edit
    add_breadcrumb "Edit thesis", edit_category_thesis_review_path(category, thesis)
  end

  def update
    thesis.update(thesis_params)
    redirect_to thesis_path(thesis.id)
  end


  private

  def thesis_params
    params.require(:thesis).permit(:title, :description, :university, :user_id)
  end
end
