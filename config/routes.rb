Rails.application.routes.draw do
  root "dashboards#show"

  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check
end
