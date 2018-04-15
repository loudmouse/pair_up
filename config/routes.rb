Rails.application.routes.draw do
  get 'attendances/create'

  get 'attendances/destroy'

  get 'users/index'

  get 'users/show'

  resources :events
  devise_for :users
  resources :users
  resources :events
  root 'events#index'

  post    '/attend',        to: 'attendances#create'
  get     '/attend',        to: 'attendances#create'
  delete  '/unattend',      to: 'attendances#destroy'


end
