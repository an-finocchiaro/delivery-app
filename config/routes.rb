Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :transport_modes, only: [:index, :new, :create, :show, :edit, :update] do
    resources :weight_rates, only: [:index, :new, :create]
    resources :distance_rates, only: [:index, :new, :create]
    resources :delivery_deadlines, only: [:index, :new, :create]
  end

  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update] do
    get 'search', on: :collection
  end

  resources :orders, only: [:index, :show, :new, :create, :edit, :update] do
    resources :order_freights, only: [:index, :new, :create] 
    post 'run', on: :member
    post 'close', on: :member
  end
 end
