Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :edit, :create ,:update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create]
  end
  resources :users, only: [:index, :show, :edit, :update]

  root 'books#top'
  get "home/about" => "books#about"
  end
