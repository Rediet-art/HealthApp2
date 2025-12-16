Rails.application.routes.draw do
  get "health/index"
  get "pages/home"
  devise_for :users

  # Root page
  root "pages#home"

  # After login dashboard
  get "/dashboard", to: "health#index", as: :dashboard

  resources :health_records
end
