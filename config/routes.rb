Rails.application.routes.draw do
  resources :weight_histories
  resources :animals do
    resources :weight_histories
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users

end
