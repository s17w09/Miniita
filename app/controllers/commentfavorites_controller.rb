# frozen_string_literal: true

class CommentfavoritesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @commentfavorite = current_user.commentfavorites.new(comment_id: params[:comment_id])
    @commentfavorite.save
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @commentfavorite = current_user.commentfavorites.find_by(comment_id: params[:comment_id])
    @commentfavorite.destroy
  end
end