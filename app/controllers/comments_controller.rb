class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  private

  def comment_params
    @post = Post.find(current_user.id)
    params.require(:comment).permit(:text).merge(author_id: current_user.id, post_id: @post.id)
  end
end
