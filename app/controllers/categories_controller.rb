class CategoriesController < ApplicationController

  expose(:categories)
  expose(:category)
  expose_decorated(:theses, ancestor: :category)#{category.thesis}


  def index
  end

  def show
  end

  def category_theses_filtr
  end
end
