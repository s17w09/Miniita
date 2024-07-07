class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to articles_path
      # sorceryのオートログイン機能
      auto_login(@user)
    else
      render :new
    end
  end

  def my_articles
    @draft_articles = current_user.articles.draft.includes(:user).order(created_at: :desc)
    @published_articles = current_user.articles.published.includes(:user).order(created_at: :desc)
  end

  def my_favorites
    @favorites = current_user.favorites.includes(:user).order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

