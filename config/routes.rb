Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'categories#index'
  devise_for :users
  resources :users

  resources :categories do
    resources :theses do
      resources :reviews
    end
  end

end
