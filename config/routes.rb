Rails.application.routes.draw do
  resources :carrierwave_images, only: [:index, :show]
  resources :dogs

  namespace :admin do
    resources :carrierwave_images, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
