Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'categories#index'
  devise_for :users
  resources :users

  resources :theses
  resources :categories
end
