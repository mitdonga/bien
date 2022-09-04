Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'bookmarks/show'
  resources :users
  resources :reviews do
    resources :comments
    resource :bookmark
  end
  resource :session
  root 'reviews#index'
	get 'about', to: 'pages#about'
	get 'terms-and-conditions', to: 'pages#terms_and_conditions'
end
