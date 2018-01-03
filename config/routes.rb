Rails.application.routes.draw do
  resources :carrierwave_images, only: [:index, :show]

  resources :dogs, only: [:index, :show]

  namespace :admin, only: [:new] do
    resources :dogs
    resources :carrierwave_images
  end

  post '/dogs', to: "admin/dogs#create"
  delete '/dogs', to: "admin/dogs#destroy"

end
