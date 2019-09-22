Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :books
  resources :users, only: [:show, :index, :edit, :update]
end
