class Admin::AnalyticsController < Admin::BaseController

  def show
    @users = User.all
    @categories = Category.order(:title)
    @dogs = Dog.order(:retired_count)
    # binding.pry
    if params[:sort] == "count"

      @orders = Order.arrange_states_by_order_count
    else
      @orders = Order.orders_by_state

    end
  end
end
