class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    if params[:latest]
      @q = Article.ransack(params[:q])
      @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).published.latest
    elsif params[:old]
      @q = Article.ransack(params[:q])
      @articles = @q.result(distinct: true).includes(:user).order(created_at: :asc).page(params[:page]).published.old
    else
      @q = Article.ransack(params[:q])
      @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).published.latest
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if params[:draft].present?
      @article.status = :draft
    else
      @article.status = :published
    end

    if @article.save
      if @article.draft?
        redirect_to article_path(@article), notice: '記事を下書きに入れました。'
      else
        redirect_to article_path(@article), notice: '投稿しました。'
      end
    else
      flash[:error] = 'タイトルと本文を入力しないと、投稿できません'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update

    if params[:published].present?
      @article.status = :published
    else
      @article.status = :draft
    end

    if @article.update(article_params)
      redirect_to article_path(@article), notice: '投稿しました。'
    else
      flash[:error] = 'タイトルと本文を入力しないと、投稿できません'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, notice: '削除しました'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end