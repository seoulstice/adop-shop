class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    if !logged_in?
      render file: "/public/404"
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :name, :address, :role)
    end


end
