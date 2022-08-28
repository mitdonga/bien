Rails.application.routes.draw do
  resources :users
  resources :reviews do
    resources :comments
  end
  resource :session
  root 'reviews#index'
end
