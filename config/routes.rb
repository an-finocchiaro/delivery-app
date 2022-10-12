Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :transport_modes
end
