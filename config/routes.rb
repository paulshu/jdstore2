Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products #, only: [:index, :new, :edit, :show]
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts
  root 'products#index'
end
