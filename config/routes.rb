Rails.application.routes.draw do
  root "dashboards#show"

  resource :session
  resources :passwords, param: :token

  resources :categories, only: %i[index new create edit update destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
