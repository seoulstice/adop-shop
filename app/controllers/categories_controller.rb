class CategoriesController < ApplicationController

  def show
    # binding.pry
    @category = Category.find_by(slug: params[:slug])
  end

  def index
    @categories = Category.order(:title)
  end

end
