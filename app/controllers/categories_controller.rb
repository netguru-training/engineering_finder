class CategoriesController < ApplicationController

  expose(:categories)
  expose(:category)
  expose(:theses, ancestor: :category)#{category.thesis}

  def index
  end

  def show
    add_breadcrumb category.name, category_path(category)
  end

  def category_theses_filtr
  end
end
