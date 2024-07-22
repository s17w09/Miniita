# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to articles_path, notice: '新規登録が完了しました。'
      # sorceryのオートログイン機能
      auto_login(@user)
    else
      flash[:alert] = '新規登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def my_articles
    @draft_articles = current_user.articles.draft.includes(:user).order(created_at: :desc)
    @published_articles = current_user.articles.published.includes(:user).order(created_at: :desc)
  end

  def my_favorites
    @like_first = current_user.favorites.where(favorite_type: :like_first).includes(:user).order(created_at: :desc)
    @like_second = current_user.favorites.where(favorite_type: :like_second).includes(:user).order(created_at: :desc)
    @like_third = current_user.favorites.where(favorite_type: :like_third).includes(:user).order(created_at: :desc)
    @like_forth = current_user.favorites.where(favorite_type: :like_forth).includes(:user).order(created_at: :desc)
    @like_fifth = current_user.favorites.where(favorite_type: :like_fifth).includes(:user).order(created_at: :desc)

  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
