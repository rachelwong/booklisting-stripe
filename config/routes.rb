Rails.application.routes.draw do
  get 'orders/new'

  get 'success', to: "orders#create"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors do
    resources :books
  end

  resources :books, only: [:new]

  resources :orders
  
  root to: "authors#index"
end