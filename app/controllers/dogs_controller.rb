class DogsController < ApplicationController

  def index
    @dogs = Dog.order(:name)
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      flash[:success] = "You've created a new dog."
      redirect_to dog_path(@dog)
    else
      flash[:failure] = "Try again."
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end


  private

    def dog_params
      params.require(:dog).permit(:name, :breed, :size, :weight, :cat_friendly, :gender, :description, :price, :carrierwave_image_id)
    end

end
