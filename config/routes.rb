Rails.application.routes.draw do
  root "top#index"
  get 'users/new'
  get 'sessions/new'
  get 'login', to: 'sessions#new', as: 'login'
  get 'signup', to: 'users#new', as: 'signup'
  get 'calendar', to: 'calendar#show', as: 'calendar'
  resources :diary_entries, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
end