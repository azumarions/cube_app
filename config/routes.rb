Rails.application.routes.draw do
  resource :account, :only => [:show] do
    resource :name, :only => [:edit, :update], module: "accounts"
    resource :avatar, :only => [:edit, :update], module: "accounts"
    resource :description, :only => [:edit, :update], module: "accounts"
  end

  resource :article, :only => [:show] do
    resources :strategies, module: "articles"
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'pages#home'
  get 'pages/show'
  get 'pages/contact'
  get 'articles/index'
  get 'clocks/rank'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :pages
  resources :microposts
  resources :users
  resources :relationships,   only: [:create, :destroy]
  resources :likes,   only: [:create, :destroy]
  resources :clocks
end