Rails.application.routes.draw do
  resources :attendances
  # Session routes
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # User sign-up route
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Dashboard route
  get 'dashboard', to: 'dashboard#index', as: :dashboard
  
  # Resources
  resources :attendance
  resources :grades
  resources :submissions
  resources :assignments
  resources :enrollments
  resources :courses
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # Set the root path to the login page by default
  root 'sessions#new'
end
