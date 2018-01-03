Rails.application.routes.draw do
  resources :carrierwave_images, only: [:index, :show]

  resources :dogs, only: [:index, :show]

  namespace :admin do
    resources :dogs, only: [:new, :create, :destroy]
    resources :carrierwave_images, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
