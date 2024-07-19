# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show
    @user = current_user
    @posted_articles = @user.articles
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
