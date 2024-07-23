Rails.application.routes.draw do
  devise_for :users
  # resources :users, only: [:show] # This line sets up RESTful routes for the Users controller, allowing you to view user profiles.
  
  # Root path of the application
  root to: 'posts#index' # Replace 'home#index' with your desired root path
  resources :posts

  namespace :users do
    get 'login_model_box', to: 'users#login_model_box', as: :login_model_box
    get 'sign_up_model_box', to: 'users#sign_up_model_box', as: :sign_up_model_box
  end

  get 'about', to: 'home#about'

  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check
end
