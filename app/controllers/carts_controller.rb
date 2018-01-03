class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    dog = Dog.find(params[:dog_id])
    @cart = Cart.new(session[:cart])
    @cart.add_dog(dog.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(dog.id), dog.name)} in your cart"
    redirect_to dogs_path 
  end

  def show 
    
  end 

end