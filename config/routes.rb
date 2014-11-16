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

  get 'custom_categories/:id', to: 'categories#custom_categories', as: 'custom_categories'

end
