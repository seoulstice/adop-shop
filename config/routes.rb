Rails.application.routes.draw do

  root :to => 'welcome#index'

  resources :carrierwave_images, only: [:index, :show]

  resources :dogs, only: [:index, :show, :create, :destroy]

  resources :categories, only: [:index]

  namespace :admin, only: [:new] do
    resources :dogs
    resources :carrierwave_images
  end

  resources :users, only: [:new, :create]

  resources :carts, only: [:create]

  get '/cart', to: "carts#show"
  delete '/cart', to: "carts#destroy"
  put '/cart', to: "carts#update"

  get "/dashboard", to: "users#show"

  get "/orders", to: "orders#index", as: "orders"
  get "/orders/:id", to: "orders#show", as: "order"

  

  controller :sessions do
    get "/login" => :new
    post "/login" => :create
    delete "/logout" => :destroy
  end

  get '/:slug', to: "categories#show", as: "category"
end
