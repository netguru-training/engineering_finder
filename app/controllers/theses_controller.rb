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
    thesis = Thesis.new()
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

  def join
    if thesis.participants.count >= thesis.limit
      redirect_to categories_path, notice: 'No free spaces available for this thesis'
    else
      current_user.chosen_thesis_id = thesis.id
      if current_user.save
        redirect_to thesis_path(thesis),  notice: 'You have been added to the thesis'
      else
        render thesis_path(thesis), notice: 'You have not been'
      end
  end


  private

  def thesis_params
    params.require(:thesis).permit(:title, :description, :university, :user_id)
  end
end
