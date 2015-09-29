Rails.application.routes.draw do

  root "books#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  resources :books, only: [:show]
  resources :line_items
  post "/line_items/add_to_cart"
  get "/cart", to: "line_items#show"

end
