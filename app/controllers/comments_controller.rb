class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_post
    
    def create
        @user = current_user
        @comment = Comment.new(comment_params)
        @comment.user = @user
        @comment.post = @post
        @comment.save
    end
    
    def destroy
    end
    
    private
    def comment_params
        params.require(:comment).permit(:message)
    end
    
    def load_item
        @post = Post.find params[:post_id]
    end
end
