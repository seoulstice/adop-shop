class DogsController < ApplicationController

  def index
    @dogs = Dog.order(:name)
  end

  def show
    @dog = Dog.find_by(slug: params[:id])
  end

  private

    def dog_params
      params.require(:dog).permit(:name, :breed, :size, :weight, :cat_friendly, :gender, :description, :price)
    end

end
