class ThesesController < ApplicationController
  expose_decorated(:theses, decorator: ThesisDecorator)
  expose(:thesis, attributes: :thesis_params)
  expose :user
  expose :categories

  def index
  end

  def show
  end

  def new
    thesis = Thesis.new()
  end

  def create
    thesis = Thesis.new(thesis_params)
    # thesis.category_id = thesis_params[:category]
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
    if thesis.available? && current_user.joined?(thesis.id) == false
      current_user.chosen_thesis_id = thesis.id
      if current_user.save
        redirect_to thesis_path(thesis),  notice: 'You have been added to the thesis'
      else
        flash[:error] = 'You have not been added'
        redirect_to thesis_path(thesis)
      end
    else
      flash[:error] = 'Thesis full or you already are added to another one'
      redirect_to thesis_path(thesis)
    end
  end


  private

  def thesis_params
    params.require(:thesis).permit(:title, :description, :university, :user_id, :category_id)
  end
end
