Rails.application.routes.draw do
  resources :users
  root 'pages#home'

  get 'about', to: 'pages#about'
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :delete]
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
