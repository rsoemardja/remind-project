Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "pages/dashboard", to: "pages#dashboard", as: "dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :tasks, as: :tasks
  resources :notes, as: :notes
end
