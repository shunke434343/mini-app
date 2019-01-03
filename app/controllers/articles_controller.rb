class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @article = Article.last
    @articles = Article.order("id DESC").limit(5)
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.order("id DESC").limit(5)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to action: :index
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params) if user_signed_in?
    redirect_to action: :index
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if user_signed_in?
    redirect_to action: :index
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
