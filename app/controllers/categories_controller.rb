class CategoriesController < ApplicationController
  expose(:categories)
  expose(:category)
  expose(:theses)
  def index

  end
  def show

  end
  
  def custom_categories
    self.theses = category.thesis
  end
end
