class ThesesController < ApplicationController
  expose :theses
  expose(:thesis, attributes: :thesis_params)
  expose :user
  expose :category

  def index
  end

  def show
  end

  def new
  end

  def create
    thesis = Thesis.new(thesis_params)
    thesis.user_id = current_user.id
    thesis.save
    redirect_to root_path
  end

  def edit
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
