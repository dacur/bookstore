Rails.application.routes.draw do

  root "books#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  resources :books, only: [:show]
  resources :orders, except: [:new] do
    member do 
      post 'submit_payment'
    end
  end

  post "/line_items/add_to_cart"
  get "/cart", to: "orders#show"
  get "/payment", to: "orders#payment"
end
