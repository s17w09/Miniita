class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    return redirect_to articles_path, notice: 'ログイン' if logged_in?
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to articles_path, success: "#{provider.titleize}アカウントでログインしました。"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to articles_path, success: "#{provider.titleize}アカウントでログインしました。"
      rescue => e
        puts e

      end
    end
  end
end