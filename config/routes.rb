Rails.application.routes.draw do
  devise_for :users
  resources :dashboard, only: [ :index ]
  resources :projects, only: [:index, :create, :destroy]
  root "home#index"
end
