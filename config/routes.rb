Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  root "todos#index"  
        # (antes do tutorial eu tinha colocado root "todos#loginmenu" e tinha funcionado)
  get "/todos", to: "todos#index"
  get "/todos/new", to: "todos#new"
  post "/todos", to: "todos#create"
  get "/todos/:id", to: "todos#show", as: "todo"
  patch "/todos/:id", to: "todos#update", as: "update_todo"
  get "/todos/edit/:id", to: "todos#edit", as: "edit_todo"
  delete "/todos/:id", to: "todos#destroy", as: "destroy_todo"
  # resources :todos

  # devise_for :users
  # get "/users/new", to: "users#new"
  # post "/users", to: "users#create"
  # resources :user, only: [:new, :create, :edit, :update, :show, :destroy]

  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  # get '/logout', to: 'sessions#destroy'
  # delete '/logout', to:'sessions#destroy', as: "destroy_session"

  # devise_for :users, controllers: { sessions: 'users/sessions' }






  # get post put delete



  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
