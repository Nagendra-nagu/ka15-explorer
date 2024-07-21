class PostsController < ApplicationController
    before_action :set_post, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
      @posts = Post.all
    end
  
    def show
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      @post.user = current_user # Assuming you have a current_user method
  
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
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
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body, :published_at, :status, tag_ids: [], category_ids: [])
    end
end
  