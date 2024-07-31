# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.new(article_id: params[:article_id], favorite_type: params[:type])
    @favorite.save

    # 通知の作成
    @article.create_notification_like!(current_user)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @favorite = current_user.favorites.find_by(article_id: params[:article_id], favorite_type: params[:type])
    @favorite.destroy
  end
end
