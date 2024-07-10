class UsersessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = login(params[:email], params[:password])
  end

  def create
    @user = login(params[:email], params[:password])
  
    if @user
      redirect_to articles_path, notice: 'ログインしました。'
    else
      render :new, error: 'ログインに失敗しました。'
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, notice: 'ログアウトしました。'
  end
end
