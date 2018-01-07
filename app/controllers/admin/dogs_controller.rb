class Admin::DogsController < Admin::BaseController

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save!
      flash[:success] = "You've created a new dog."
      redirect_to dog_path(@dog.slug)
    else
      flash[:failure] = "Try again."
      render :new
    end
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)

    redirect_to admin_dogs_path
  end

  private

    def dog_params
      params.require(:dog).permit(:name, :breed, :size, :weight, :cat_friendly, :gender, :description, :price, :category_id, :retired, :image)
    end

end
