class Admin::UsersController < Admin::BaseController

  def show
    @search = OrderSearch.new(search_params)
    @orders = @search.results.order(:updated_at)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(current_user.id, user_params)
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  private

      def user_params
        params.require(:user).permit(:username, :password, :name, :address)
      end

  protected
    def search_params
      (params[:order_search] || {})
    end


end
