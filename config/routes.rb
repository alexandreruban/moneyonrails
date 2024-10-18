Rails.application.routes.draw do
  root "dashboards#show"

  resource :session
  resources :passwords, param: :token

  resources :categories, only: %i[index new create edit update destroy]
  resources :accounts, only: %i[index new create edit update destroy]
  resources :transactions, only: %i[index new create edit update destroy]
  resources :imports, only: %i[index new create]

  get "up" => "rails/health#show", as: :rails_health_check
end
