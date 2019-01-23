Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: %i[index show]
  devise_for :users

  namespace :admin do
    root 'products#index'
    resources :products
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
