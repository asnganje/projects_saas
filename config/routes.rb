Rails.application.routes.draw do
  get "organization_users/index"
  get "calendar", to: "calendar#index"
  mount GoodJob::Engine => "good_job"
  resources :notifications, only: [ :index ]
  get "search", to: "search#index"
  get "read_notifications", to: "read_notifications#read_all"
  devise_for :users
  resources :dashboard, only: [ :index ]
  resources :projects do
    resources :tasks
  end
  root "home#index"
end
