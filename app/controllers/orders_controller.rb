class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_user.orders.new(purchaser: current_user.name, address: current_user.address)
    set_cart.contents.each do |dog, quantity|
      OrderDog.create(dog_id: dog.to_i, order: @order, quantity: quantity.to_i)
    end
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
