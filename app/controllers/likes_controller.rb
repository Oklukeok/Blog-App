class LikesController < ApplicationController
  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    return unless @like.save

    redirect_to user_path(current_user), notice: 'Like was successfully created.'
  end
end
