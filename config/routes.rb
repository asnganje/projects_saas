Rails.application.routes.draw do
  resources :teams
  authenticate :user, ->(user) { user.organization_owner? } do
    resources :subscriptions
    get "billing", to: "billing#portal"
    resources :organization_users do
      member do
        post "/change_role", to: "organization_users#change_role"
      end
    end
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  end

  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => "good_job"
    namespace :admin do
      resources :dashboard 
    end
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
