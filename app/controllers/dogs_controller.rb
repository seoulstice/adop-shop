class DogsController < ApplicationController

  def index
    @dogs = Dog.sort_dogs
  end

  def show
    @dog = Dog.find_by(slug: params[:id])
  end

end
