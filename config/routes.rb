Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :transport_modes, only: [:index, :new, :create, :show, :edit, :update] do
    resources :weight_rates, only: [:new, :create, :show]
    resources :distance_rates, only: [:new, :create, :show]
  end
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update] do
    get 'search', on: :collection
  end
end
