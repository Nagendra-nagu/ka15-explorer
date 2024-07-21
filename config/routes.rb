Rails.application.routes.draw do
  devise_for :users
  # resources :users, only: [:show] # This line sets up RESTful routes for the Users controller, allowing you to view user profiles.
  
  # Root path of the application
  root to: 'posts#index' # Replace 'home#index' with your desired root path
  resources :posts
  get 'about', to: 'home#about'
  get 'show_model_box', to: 'index#show_model_box'

  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check
end
