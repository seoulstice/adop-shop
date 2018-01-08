class DogsController < ApplicationController

  def index
    @dogs = Dog.order(:name)
  end

  def show
    @dog = Dog.find_by(slug: params[:id])
  end

end
