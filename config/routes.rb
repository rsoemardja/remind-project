Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  #post '/notes/:note_id/notes/:id/show_confirm', to: "notes#confirm", as: "confirm"
  #post '/notes/:note_id/notes/:id/show_reject', to: "notes#reject", as: "reject"

  #post '/tasks/:task_id/tasks/:id/show_confirm', to: "tasks#confirm", as: "confirm_tasks"
  #post '/tasks/:task_id/tasks/:id/show_reject', to: "tasks#reject", as: "reject_tasks"

  # root "posts#index"

  resources :tasks, as: :tasks
  resources :notes, as: :notes


  # resources :users do
  # resources :tasks, as: :tasks
  # resources :notes, as: :notes
  # end
  
end
