Rails.application.routes.draw do
  resources :attendances # Removed duplicate resource
  # Session routes
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

  get 'send_email', to: 'dashboard#send_email', as: :send_email
  # User sign-up route
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'forgot', to: 'sessions#forgot', as: :forgot_password
  post 'forgot_password', to: 'sessions#send_reset_instructions', as: :forgot_password_submit
    # config/routes.rb
  post 'dashboard/link_student', to: 'dashboard#link_student', as: 'link_student'

  # Resources block for users
  resources :users do
    # Member route: link a student to a guardian (PUT)
    put 'link_student', on: :member

    # Collection route: show the page to link a guardian with a student (GET)
    get 'link_guardian_student', on: :collection
  end
  
  # Dashboard route
  get 'dashboard', to: 'dashboard#index', as: :dashboard
  
  # Other resources
  resources :grades
  resources :submissions
  resources :assignments
  resources :enrollments
  resources :courses
  resources :sessions, only: [:new, :create, :destroy]

  # Set the root path to the login page by default
  root 'sessions#new'
end
