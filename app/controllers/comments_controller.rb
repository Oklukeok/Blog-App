class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user
    if @comment.save!
      redirect_to post_show_path(current_user)
    else
      flash.now[:alert] = 'Comment creation failed'
    end
  end

  def comment_params
    params.require(:comment).permit(:post_id, :text)
  end
end
