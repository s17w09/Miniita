class FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    if params[:type] == 'like_first'
      @favorite = current_user.favorites.new(article_id: params[:article_id], favorite_type: :like_first)
    elsif params[:type] == 'like_second'
      @favorite = current_user.favorites.new(article_id: params[:article_id], favorite_type: :like_second)
    end

    if @favorite.save
      render :create
    end
  end

  def destroy
    @article = Article.find(params[:article_id])

    if params[:type] == 'like_first'
      @favorite = current_user.favorites.find_by(article_id: params[:article_id], favorite_type: :like_first)
    elsif params[:type] == 'like_second'
      @favorite = current_user.favorites.find_by(article_id: params[:article_id], favorite_type: :like_second)
    end

    if @favorite&.destroy!
      render :destroy
    end
  end
end