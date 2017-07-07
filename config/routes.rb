Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products #, only: [:index, :new, :edit, :show]
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
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

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  resources :cart_items
  root 'products#index'
end
