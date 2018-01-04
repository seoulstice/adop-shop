Rails.application.routes.draw do

  root :to => 'welcome#index'

  resources :carrierwave_images, only: [:index, :show]

  resources :dogs, only: [:index, :show, :create, :destroy]

  namespace :admin, only: [:new] do
    resources :dogs
    resources :carrierwave_images
  end

  resources :carts, only: [:create]

  get '/cart', to: "carts#show"
  delete '/cart', to: "carts#destroy"

end
