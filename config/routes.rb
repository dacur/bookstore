Rails.application.routes.draw do

  root "books#index"
  devise_for :users
  get "books/sort"

end
