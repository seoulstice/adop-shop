class Admin::OrdersController < Admin::BaseController

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_dashboard_path
  end

  private
    def order_params
      params.require(:order).permit(:status, :address, :purchaser)
    end
end
