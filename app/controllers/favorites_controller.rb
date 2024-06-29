class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.new(article_id: params[:article_id], favorite_type: params[:type])
    if @favorite.save
      redirect_to article_path(params[:article_id])
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(article_id: params[:article_id], favorite_type: params[:type])
    if @favorite.destroy!
      redirect_to article_path(params[:article_id]), status: :see_other
    end
end
end
