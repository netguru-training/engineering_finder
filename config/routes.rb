Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'categories#index'
  devise_for :users
  resources :users

  resources :categories
  resources :theses do
    resources :reviews
  end

  get 'category_theses/:id', to: 'categories#category_theses', as: 'category_theses_filtr'
  get 'theses/:id/join', to: "theses#join", as: 'theses_join'

end
