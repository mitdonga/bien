Rails.application.routes.draw do
  get 'comments/show'
  get 'comments/new'
  get 'comments/edit'
  resources :reviews do
    resources :comments
  end
  root 'reviews#index'
end
