class CommentfavoritesController < ApplicationController
  def create
    @commentfavorite = current_user.commentfavorites.new(comment_id: params[:comment_id])
    if @commentfavorite.save
      redirect_to comment_path(params[:comment_id])
    end
  end

  def destroy
    @commentfavorite = current_user.commentfavorites.find_by(comment_id: params[:comment_id])
    if @commentfavorite.destroy!
      redirect_to comment_path(params[:comment_id]), status: :see_other
    end
  end
end
