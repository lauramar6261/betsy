Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/create'
  root 'products#home'

  get "/auth/:provider/callback", to: "sessions#create", as: "login"

  # get 'sessions/login', to: "sessions#new" #page for a new session
  delete "/logout", to: "sessions#destroy", as: "logout"

  # get 'sessions/new', to: "sessions#create" #create a new session login
  # get 'sessions/destroy', to: "sessions#destroy" #delete a session logout
  resources :carts, only: [:show]

  post "order_items/cart_direct/:id", to: "order_items#cart_direct", as: "quick_shop"
  resources :order_items, only: [:create, :update, :destroy]

  resources :reviews
  resources :orders

  get 'products/category/:id', to: "products#category", as: "category"
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
