Rails.application.routes.draw do
  get 'students/index'

  mount Upmin::Engine => '/admin'
  root to: 'categories#index'
  devise_for :users
  resources :users

  resources :categories do
    resources :theses do
      resources :reviews
    end
  end

  get 'category_theses/:id', to: 'categories#category_theses', as: 'category_theses'

end
