class Admin::AnalyticsController < Admin::BaseController

  def show
    @users = User.all
  end


end
