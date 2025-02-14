class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all
    end
  
    # READ - Show one post
    def show
        @post = Post.find(params[:id])
    end
      
  
    # CREATE - Show form for new post
    def new
        @post = Post.new
    end
      
  
    # CREATE - Save new post
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post created successfully!'
      else
        render :new
      end
    end
  
    # UPDATE - Show edit form
    def edit
        @post = Post.find(params[:id]) # Find post by ID
    end
      
      
  
    # UPDATE - Save changes
    def update
        @post = Post.find(params[:id]) # Find post by ID
      
        if @post.update(post_params)  # Use strong params
          redirect_to @post, notice: "Post updated successfully!"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    # DELETE - Remove post
    def destroy
        @post = Post.find(params[:id]) # Find the post by ID
        @post.destroy # Delete the post
      
        redirect_to posts_path, notice: "Post deleted successfully!" # Redirect after deletion
    end
      
  
    private
    
    def set_post
        @post = Post.find(params[:id])
    end
  
    # Strong parameters

    def post_params
        params.require(:post).permit(:title, :content)  # Ensure strong parameters
    end

end
  