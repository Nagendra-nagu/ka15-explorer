class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
  
    # Devise provides a helper method current_user to access the logged-in user
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || root_path
    end
  end