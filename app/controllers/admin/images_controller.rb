class Admin::ImagesController < Admin::BaseController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "You've created an image."
      redirect_to dashboard_path
     else
      render :new
    end
  end

  private

    def image_params
      params.require(:image).permit(:image, :name)
    end
end
