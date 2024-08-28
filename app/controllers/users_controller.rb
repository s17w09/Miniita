# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  include ApplicationHelper

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
    
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
