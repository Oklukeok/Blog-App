class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @comments = Comment.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user
    flash.now[:notice] = 'Comment created successfully' if @post.save!
    redirect_to user_path(current_user)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.all
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
