Rails.application.routes.draw do
  resources :carrierwave_images
  resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
