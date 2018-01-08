class ApplicationController < ActionController::Base
  include CollectionsHelper

  before_action :set_cart
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_admin?
  helper_method :set_cart
  helper_method :all_categories

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def all_categories
    @categories = Category.order(:title)
  end

  def logged_in?
    !current_user.nil?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

end
