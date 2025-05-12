Rails.application.routes.draw do
  resources :dashboard, only:[:index]
  root "home#index"
end
