class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :load_post

	def create
		# @user = current_user
		# @comment = Comment.new(comment_params)
		# @comment.user = @user
		# @comment.post = @post
		# @comment.save

		@comment = @post.comments.create!(comment_params)
		# @comment_message = ActionController::Base.helpers.render(@comment)

		# redirect_back(fallback_location: root_path) # 실패했을 경우 root_path로
	end

	def destroy
		@comment = @post.comments.find params[:id]
		@comment.destroy
		# redirect_to post_path(@post)
		redirect_back(fallback_location: root_path)
	end

	private
	def comment_params
		params[:comment][:user_id] = current_user.id
		params.require(:comment).permit(:user_id, :message)
	end

	def load_post
		@post = Post.find params[:post_id]
	end
end
