class CommentsController < ApplicationController
    before_action :set_post
    

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        
        if @comment.save
            redirect_to @post, notice: "Comment added!"
        else
            redirect_to @post, alert: "Failed to add comment."
        end
    end
    
    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to @post, notice: "Comment deleted successfully."
    end

    private
    
    def set_post
        @post = post.find(params[:post_id])
    end
    
    
end
  