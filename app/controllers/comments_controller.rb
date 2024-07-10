class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  def index
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(create_comment_params)
    if @comment.save
    render: create, notice: 'コメントしました。'
  end


  def show
    @comment = Comment.find(params[:id])
  end

  def edit; end

  def update
    if @comment.update(update_comment_params)
      redirect_to article_url, notice: 'コメントを編集しました。'
    end
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