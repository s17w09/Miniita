# frozen_string_literal: true

class UsersessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = login(params[:email], params[:password])
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to articles_path, notice: 'ログインしました。'
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, notice: 'ログアウトしました。'
  end
end
