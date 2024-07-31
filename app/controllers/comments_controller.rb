# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  def index
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit; end

  def create
    @comment = current_user.comments.build(create_comment_params)
    @article = @comment.article
    @comment.save
    # 通知の作成
    @article.create_notification_comment!(current_user, @comment.id)
  end

  def update
    @comment.update(update_comment_params)
  end

  def destroy
    @comment.destroy!
  end

  private

  def create_comment_params
    params.require(:comment).permit(:body).merge(article_id: params[:article_id])
  end

  def update_comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end
end
