class CarrierwaveImagesController < ApplicationController
  before_action :set_carrierwave_image, only: [:show, :edit, :update, :destroy]

  # GET /carrierwave_images
  # GET /carrierwave_images.json
  def index
    @carrierwave_images = CarrierwaveImage.all
  end

  # GET /carrierwave_images/1
  # GET /carrierwave_images/1.json
  def show
  end

  # GET /carrierwave_images/new
  def new
    @carrierwave_image = CarrierwaveImage.new
  end

  # GET /carrierwave_images/1/edit
  def edit
  end

  # POST /carrierwave_images
  # POST /carrierwave_images.json
  def create
    @carrierwave_image = CarrierwaveImage.new(carrierwave_image_params)

    respond_to do |format|
      if @carrierwave_image.save
        format.html { redirect_to @carrierwave_image, notice: 'Carrierwave image was successfully created.' }
        format.json { render :show, status: :created, location: @carrierwave_image }
      else
        format.html { render :new }
        format.json { render json: @carrierwave_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carrierwave_images/1
  # PATCH/PUT /carrierwave_images/1.json
  def update
    respond_to do |format|
      if @carrierwave_image.update(carrierwave_image_params)
        format.html { redirect_to @carrierwave_image, notice: 'Carrierwave image was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrierwave_image }
      else
        format.html { render :edit }
        format.json { render json: @carrierwave_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrierwave_images/1
  # DELETE /carrierwave_images/1.json
  def destroy
    @carrierwave_image.destroy
    respond_to do |format|
      format.html { redirect_to carrierwave_images_url, notice: 'Carrierwave image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrierwave_image
      @carrierwave_image = CarrierwaveImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrierwave_image_params
      params.require(:carrierwave_image).permit(:asset)
    end
end
