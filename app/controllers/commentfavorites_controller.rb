# frozen_string_literal: true

class CommentfavoritesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @commentfavorite = current_user.commentfavorites.new(comment_id: params[:comment_id])
    @commentfavorite.save

    # コメントいいねの通知
    @comment.create_notification_commentlike!(current_user)
  end

  def destroy
    @commentfavorite = Commentfavorite.find(params[:id])
    @comment = @commentfavorite.comment
    @commentfavorite.destroy
  end
end
