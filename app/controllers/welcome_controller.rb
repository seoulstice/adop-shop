class WelcomeController < ApplicationController
  def index
    @dogs = Dog.all
    @order_dogs = OrderDog.all
  end
end
