class Admin::UsersController < Admin::BaseController

  def show

  end

  private

      def user_params
        params.require(:user).permit(:username, :password, :role, :name, :address)
      end

end
