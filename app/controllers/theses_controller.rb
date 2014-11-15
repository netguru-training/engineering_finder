class ThesesController < ApplicationController
  def index

  end

  def show

  end

  def new
    @thesis = Thesis.new()
  end

  def create
    @thesis = Thesis.new(thesis_params)
    @thesis.save()
    redirect_to root_path
  end

  def delete

  end



  private

  def thesis_params
    params.require(:thesis).permit(:title, :description, :university)
  end
end
