Rails.application.routes.draw do
  root "top#index"
  get 'users/new'
  get 'sessions/new'
  get 'login', to: 'sessions#new', as: 'login'  
  get 'signup', to: 'users#new', as: 'signup'  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
end
