Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  resources :dashboard, only: [ :index ]
  resources :projects
  root "home#index"
end
