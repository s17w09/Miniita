class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user).order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @new_comment = Comment.new
    @comments = @article.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    end
  end


  def destroy
    @article.destroy!
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end