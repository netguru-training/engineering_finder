Rails.application.routes.draw do
  get 'students/index'

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :theses
  resources :categories

  get 'custom_categories/:id', to: 'categories#custom_categories', as: 'custom_categories'

end
