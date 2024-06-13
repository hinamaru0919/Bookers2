Rails.application.routes.draw do
  get "/top", to: "pages#top"

  resources :books
  post 'create_user' => 'users#create'
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "home#top"
  get '/home/about', to: 'home#about', as: 'about'

  resources :users, only: [:show, :edit, :destroy, :update, :index]

  patch 'books/:id' => 'books#update', as: 'update_book'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
