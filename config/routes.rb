Rails.application.routes.draw do
  root 'home#index'

  resources :books, only: [:new, :create, :show]
end
