class FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.new(article_id: params[:article_id], favorite_type: params[:type])
    @favorite.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.find_by(article_id: params[:article_id], favorite_type: params[:type])
    @favorite.destroy
  end
end
