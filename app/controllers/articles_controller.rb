class ArticlesController < ApplicationController
  def index
    @articles = Article.all 
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end 
  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

end 