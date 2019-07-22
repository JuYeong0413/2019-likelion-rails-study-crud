class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :load_post
	
	def create
		@user = current_user
		@comment = Comment.new(comment_params)
		@comment.user = @user
		@comment.post = @post
		@comment.save

		redirect_to post_path(@post)
	end
	
	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
	
	private
	def comment_params
		params.require(:comment).permit(:message)
	end
	
	def load_item
		@post = Post.find params[:post_id]
	end
end
