class CategoriesController < ApplicationController

  expose(:categories)
  expose(:category)
  expose_decorated(:theses, decorator: ThesisDecorator, ancestor: :category)

  def index
  end

  def show
  end

  def category_theses_filtr
  end
end
