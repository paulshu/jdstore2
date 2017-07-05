Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :products #, only: [:index, :new, :edit, :show]
  end

  root 'product#index'
end
