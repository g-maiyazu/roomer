Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/tos', to: 'static_pages#tos'
  get '/map', to: 'static_pages#map'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  resources :users, only: [:index, :show] do
    collection do
      get :search
    end
  end

  devise_scope :user do
    get "signup", to: "users/registrations#new"
    post "signup", to: "users/registrations#create"
    get 'confirm_email', to: 'users/registrations#confirm_email'
    get "edit_user", to: "users/registrations#edit"
    patch "update_user", to: "users/registrations#update"
    get "login", to: "users/sessions#new"
    post "login", to: "users/sessions#create"
    delete "logout", to: "users/sessions#destroy"
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :profiles, only: [:show, :edit, :update]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :likes, only: [:create, :destroy]

  resources :relationships, only: [:create, :destroy]

  resources :notifications, only: [:index]
end
