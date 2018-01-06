class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:notice] = "Please try again."
      redirect_to cart_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:purchaser, :address)
  end
end
