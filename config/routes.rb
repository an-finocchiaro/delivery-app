Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :transport_modes, only: [:index, :new, :create, :show, :edit, :update]
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update]
end
