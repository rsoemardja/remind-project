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
    resources :reviews, only: :create
    

  get "tasks/:id/destroy", to: "tasks#destroy", as: :destroy_task

  resources :notes, except: :destroy
  get "notes/:id/destroy", to: "notes#destroy", as: :destroy_note

  resources :tasks do
    member do
      post 'trash'
      post 'restore'
    end

    collection do
      get 'trash', to: 'tasks#trash_index'
      delete 'empty_trash', to: 'tasks#empty_trash'
      post 'trash_all'
    end
  end

  resources :notes do
    member do
      post 'trash'
      post 'restore'
    end

    collection do
      get 'trash', to: 'notes#trash_index'
      delete 'empty_trash', to: 'notes#empty_trash'
      post 'trash_all'
    end
  end

  resources :tasks do
    member do
      delete 'delete_photo/:photo_id', to: 'tasks#delete_photo', as: 'delete_photo'
    end
  end
end
