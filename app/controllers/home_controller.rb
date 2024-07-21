# app/controllers/home_controller.rb
class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:about, :show_model_box]
    def about
    end

    def show_model_box
        @modal_title = params[:modal_title]
        @modal_content = params[:modal_content]
        render partial: "layouts/show_modal"
    end
end
  