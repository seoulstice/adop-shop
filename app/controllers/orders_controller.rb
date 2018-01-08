class OrdersController < ApplicationController
  def index
    if logged_in? == false 
      render file: '/public/404'
    end
  end

  def show
    @order = Order.find(params[:id])
    if logged_in? && @order.user_id == current_user.id || current_admin?
      render :show
    else
      render file: '/public/404'
    end
  end

  def create
    if logged_in?
      @order = current_user.orders.new(purchaser: current_user.name, address: current_user.address)
      set_cart.contents.each do |dog, quantity|
        OrderDog.create(dog_id: dog.to_i, order: @order, quantity: quantity.to_i)
      end
      if @order.save
        flash[:success] = "Order was successfully placed"
        session.delete(:cart)
        redirect_to orders_path
      else
        flash[:notice] = "Please try again."
        redirect_to cart_path
      end
    else
      redirect_to login_path
    end

  end

  private

  def order_params
    params.require(:order).permit(:purchaser, :address, :status)
  end
end
