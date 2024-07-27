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

    def post_model_box
      @post = params["id"].present? ?Post.find(params["id"]) : Post.new
      @show_pos = params["id"].present? ? true : false
      @url = @post.image_url
      @title = params["title"]
      respond_to do |format|
        format.js { render 'post_model_box' }
      end
    end
  
    def create
      result = CreatePost.call(post_params: post_params, current_user: current_user)
      @post = result[:post]
      if !result.failure?
        respond_to do |format|
          format.js { render 'create_model_box' }
        end
      end
    end
  
    def edit
    end
  
    def update
      result = UpdatePost.call(post: @post, post_params: post_params, current_user: current_user)
      @post = result[:post]
      if !result.failure?
        respond_to do |format|
          format.js { render 'create_model_box' }
        end
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
      params.require(:post).permit(:title, :body, :status, :user_id, :position, :location, tag_ids: [], category_ids: [], attachments_attributes: [:id, :file, :_destroy])
    end
end
  