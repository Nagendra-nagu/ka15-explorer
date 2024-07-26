Rails.application.routes.draw do
  devise_for :users
  
  root to: 'posts#open_posts'

  get 'about', to: 'home#about'

  resources :posts do
    collection do
      get 'create_model_box'
      get 'open_posts'
    end
  end

  namespace :users do
    get 'login_model_box', to: 'users#login_model_box', as: :login_model_box
    get 'sign_up_model_box', to: 'users#sign_up_model_box', as: :sign_up_model_box
    get 'forgot_password_modal_box', to: 'users#forgot_password_modal_box', as: :forgot_password_modal_box
    get 'get_more_options', to: 'users#get_more_options', as: :get_more_options
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
