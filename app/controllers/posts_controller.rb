class PostsController < ApplicationController
    before_action :set_post, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: [:open_posts, :show]
  
    def index
      @posts = Post.all
    end

    def open_posts
      @posts = Post.all
    end
  
    def show
    end
  
    def new
      @post = Post.new
    end

    def create_model_box
      @post = Post.new
      respond_to do |format|
        format.js { render 'create_model_box' } # Ensure this file exists
      end
    end
  
    def create
      result = CreatePost.call(post_params: post_params, current_user: current_user)
      @post = result[:post]
      if !result.failure?
        respond_to do |format|
          format.js { render 'create_model_box' } # Ensure this file exists
        end
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
  
    private
  
    def set_post
      @post = Post.find_by(id: params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body, :status, :user_id, tag_ids: [], category_ids: [], attachments_attributes: [:id, :file, :_destroy])
    end
end
  