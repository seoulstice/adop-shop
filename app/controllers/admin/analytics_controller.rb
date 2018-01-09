class Admin::AnalyticsController < Admin::BaseController

  def show
    @users = User.all
    @categories = Category.order(:title)
    @dogs = Dog.order(:retired_count)
    @orders = Order.all
  end
end
