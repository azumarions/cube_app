Rails.application.routes.draw do
  resource :account, :only => [:show] do
    resource :name, :only => [:edit, :update], module: "accounts"
    resource :avatar, :only => [:edit, :update], module: "accounts"
    resource :description, :only => [:edit, :update], module: "accounts"
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root 'pages#home'
  get 'pages/show'
  get 'pages/index'
  get 'users/show'
  get 'users/index'
  get 'microposts/show'
  get 'microposts/index'
  post 'microposts/new'


  resources :pages
  resources :microposts
  resources :users
end