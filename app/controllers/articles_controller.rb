# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_article, only: %i[edit update destroy]

  def index
    @q = Article.ransack(params[:q])
    @articles = if params[:latest]
                  @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).published.latest
                elsif params[:old]
                  @q.result(distinct: true).includes(:user).order(created_at: :asc).page(params[:page]).published.old
                else
                  @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).published.latest
                end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = current_user.articles.build(article_params)

    @article.status = if params[:draft].present?
                        :draft
                      else
                        :published
                      end

    if @article.save
      if @article.draft?
        redirect_to article_path(@article), notice: '記事を下書きに入れました。'
      else
        redirect_to article_path(@article), notice: '投稿しました。'
        @article.create_notification_badge(current_user, @article.id)
      end
    else
      flash[:error] = 'タイトルと本文を入力しないと、投稿できません。'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @article.status = if params[:published].present?
                        :published
                      else
                        :draft
                      end

    if @article.update(article_params)
      if @article.draft?
        redirect_to article_path(@article), notice: '記事を下書きに入れました。'
      else
        redirect_to article_path(@article), notice: '投稿しました。'
      end
    else
      flash[:error] = 'タイトルと本文を入力しないと、投稿できません。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, notice: '削除しました。'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end
