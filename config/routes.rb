Rails.application.routes.draw do
  resources :teams
  resources :subscriptions
  authenticate :user, ->(user) { user.organization_owner? } do
    resources :organization_users do
      member do
        post "/change_role", to: "organization_users#change_role"
      end
    end
    mount GoodJob::Engine => "good_job"
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  end
    get "calendar", to: "calendar#index"
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
