class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :load_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	# 글쓰기
	def new
		@post = Post.new
	end

	def create
		@user = current_user
		@post = Post.new(set_params)
		@post.user = @user
		@post.save

		redirect_to root_path
	end

	# 상세보기
	def show
		# @comments = Comment.where(post: @post)
		@comment = Comment.new
		@comments = @post.comments.order(created_at: :desc)
		@post.increase_view_count
	end

	# 수정
	def edit
	end

	def update
		@post.update!(set_params)
		redirect_to post_path(@post)
	end

	# 삭제
	def destroy
		@post.destroy
		redirect_to root_path
	end

	private
	def load_post
		@post = Post.find params[:id]
	end

	def set_params
		params.require(:post).permit(:title, :content, :image, :view_count)
	end
end
