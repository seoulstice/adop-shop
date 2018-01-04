class CategoriesController < ApplicationController

  def show
    @category = Category.find(slug: params[:id])
  end


end
