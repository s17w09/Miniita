class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc).published
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
        redirect_to article_path(@article), notice: '投稿が下書きされました。'
      else
        redirect_to article_path(@article), notice: '投稿が公開されました。'
      end
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update

    if params[:draft].present?
      @article.status = :draft
    else
      @article.status = :published
    end

    if @article.update(article_params)
      redirect_to article_path(@article), notice: '下書きが投稿されました。'
    else
      render article_path(@article), notice: '下書きを再度保存しました。'
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end