Rails.application.routes.draw do
  resources :animals
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
