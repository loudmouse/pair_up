Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  resources :events
  devise_for :users
  resources :users
  resources :events
  root 'events#index'


end
