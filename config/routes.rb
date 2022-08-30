Rails.application.routes.draw do
  get 'bookmarks/show'
  resources :users
  resources :reviews do
    resources :comments
    resource :bookmark
  end
  resource :session
  root 'reviews#index'
end
