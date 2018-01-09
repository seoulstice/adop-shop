class Admin::AnalyticsController < Admin::BaseController

  def show
    @users = User.all
    @categories = Category.order(:title)
  end


end
