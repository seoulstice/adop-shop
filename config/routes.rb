Rails.application.routes.draw do

  root :to => 'welcome#index'

  resources :carrierwave_images, only: [:index, :show]

  resources :dogs, only: [:index, :show, :create, :destroy]

  resources :categories, only: [:index]

  namespace :admin do
    resources :dogs, only: [:new, :create, :index, :edit, :update]
    resources :carrierwave_images, only: [:new, :create]
    resources :users, only: [:edit, :update]
    resources :orders, only: [:update]
    get "/dashboard", to: "users#show"
    get "/analytics-dashboard", to: "analytics#show"
  end

  resources :users, only: [:new, :create]

  resources :carts, only: [:create]

  get '/cart', to: "carts#show"
  delete '/cart', to: "carts#destroy"
  put '/cart', to: "carts#update"

  get "/dashboard", to: "users#show"

  resources :orders, only: [:index, :show, :create]

  controller :sessions do
    get "/login" => :new
    post "/login" => :create
    delete "/logout" => :destroy
  end

  get '/:slug', to: "categories#show", as: "category"
end
