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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    session[:user_id] = @user.id
    binding.pry
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end



  private

    def user_params
      params.require(:user).permit(:username, :password, :name, :address, :role)
    end


end
