class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		# @post = Post.new(params["post"])
		# @post = Post.new(params.require(:post).permit(:title, :description))
		@post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
		# @post.update(params["post"])
		# @post.update(params.require(:post).permit(:title))
		@post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
 
	# the below takes the desired param keys as an argument from the create or update methods, then creates a permit list from that argument, so post_params can return customized permitted params to the method.
	def post_params(*args)
		params.require(:post).permit(*args)
	end

end
