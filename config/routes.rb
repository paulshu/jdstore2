Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products #, only: [:index, :new, :edit, :show]
  end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :orders

  resources :cart_items
  root 'products#index'
end
