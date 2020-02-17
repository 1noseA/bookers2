Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show]
  resources :users, only: [:index, :show, :edit, :create]
end
