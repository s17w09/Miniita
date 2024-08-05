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

  def my_badges
    @first_article = current_user.first_published
    @third_article = current_user.third_published
    @fifth_article = current_user.fifth_published
    @tenth_article = current_user.tenth_published
    @twentieth_article = current_user.twentieth_published
    @thirtieth_article = current_user.thirtieth_published
  end

  def my_dashboards
    @article = current_user.articles.published

    def text
      @user_input = params[:user_input]
      return if @user_input.blank?

      client = OpenAI::Client.new

      response = client.chat(
        parameters: {
          model: 'gpt-4o-mini', # Required.
          messages: [
            { role: 'system', content: "あなたは優秀なWEBエンジニアです。初心者エンジニアでもわかるように、userの質問に回答してください。
        ユーザーから、「「」についてテンプレート化してください。」という文言とその一言が送信されたら、鉤括弧内の文言をもとに、初心者エンジニアでも書きやすい技術記事のテンプレートを、3~5項目で作成してください。
        ユーザーから、「「」について内容を正確に確認し、誤っていれば内容を指摘してください。」という文言とともに記事内容が送信されたら、鉤括弧内の内容をもとに、内容の正確性を確認し誤っていれば内容を指摘してください。
        ユーザーから、「「」について誤字脱字、文章構成を確認し、誤っていれば内容を指摘してください。」の内容とともに質問などが送られてきたら、鉤括弧内の内容をもとに、誤字脱字・文章構成を確認し誤っていれば内容を指摘してください。
        ユーザーから、上記以外の内容が送信されたら、その内容に正確に回答してください。
        " },
            { role: 'user', content: @user_input }
          ], # Required.
          temperature: 0.7,
          max_tokens: 600 # 平均でひらがな１文字１～２トークン、漢字１文字２～３トークンのため、日本語300文字程度と考え600に設定
        }
      )

      @text = response.dig('choices', 0, 'message', 'content')
      render json: { text: @text }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
