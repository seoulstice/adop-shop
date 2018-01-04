class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    dog = Dog.find(params[:dog_id])
    @cart.add_dog(dog.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(dog.id), dog.name)} in your cart"
    redirect_back(fallback_location: dogs_path)
  end

  def show
    
  end

  def destroy
    dog = Dog.find(params[:dog_id])
    @cart.remove_dog(dog.id)
    session[:cart] = @cart.contents
    flash[:notice] = %Q[Successfully removed #{view_context.link_to "#{dog.name}", "#{dog_path(dog.slug)}"} from your cart.]
    redirect_back(fallback_location: cart_path)
  end

  def update
    @cart.contents[params[:dog_id]] = params[:quantity].to_i
    redirect_to cart_path
  end

end
