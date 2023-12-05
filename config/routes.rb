Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "pages/dashboard", to: "pages#dashboard", as: "dashboard"
  get 'users/:id', to: 'users#show', as: "profile"
  # config.action_controller.trailing_slash = false
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :tasks, as: :tasks, except: :destroy
  get "tasks/:id/destroy", to: "tasks#destroy", as: :destroy_task

  resources :notes, except: :destroy
  get "notes/:id/destroy", to: "notes#destroy", as: :destroy_note
end
