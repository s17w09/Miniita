class MyFavoritesController < ApplicationController
  def index
    @like_first = current_user.favorites.where(favorite_type: :like_first).includes(:user).order(created_at: :desc)
    @like_second = current_user.favorites.where(favorite_type: :like_second).includes(:user).order(created_at: :desc)
    @like_third = current_user.favorites.where(favorite_type: :like_third).includes(:user).order(created_at: :desc)
    @like_forth = current_user.favorites.where(favorite_type: :like_forth).includes(:user).order(created_at: :desc)
    @like_fifth = current_user.favorites.where(favorite_type: :like_fifth).includes(:user).order(created_at: :desc)
  end
end
