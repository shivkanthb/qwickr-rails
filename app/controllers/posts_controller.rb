class PostsController < ApplicationController
  def index
  	@posts = Post.page(params[:page]).per(2)
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params.require(:post).permit(:title, :content))
  	if @post.save
  		redirect_to root_path
  	else
  		render "new"
  	end
  end

end
