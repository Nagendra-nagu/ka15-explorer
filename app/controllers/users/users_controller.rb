module Users
    class UsersController < ApplicationController
        before_action :authenticate_user!, except: [:login_model_box, :sign_up_model_box]

        def login_model_box
            respond_to do |format|
                format.js { render 'users/login_model_box' }
            end
        end

        def sign_up_model_box
            respond_to do |format|
                format.js { render 'users/sign_up_model_box' }
            end
        end
    end
end