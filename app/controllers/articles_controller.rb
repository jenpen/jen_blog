class ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]

# allows for authentication for every action except index and show
  http_basic_authenticate_with name: "jgp", password: "hallalujuah", except: [:index, :show]

# This shows me a list of all the articles
  def index
    @articles = Article.all
  end

# This shows me an individual Article
  def show
  end

# Takes us to the template that renders a view of articles/new
  def new
  end

# Updates an article
  def edit
  end

# Saves the information from the form into the database
  def create
    @article = Article.new(article_params)

    if @article.save!
      redirect_to @article
    else
      render "new"
    end
  end

# Applies the edits from the edit to controller to the database
  def update

    if @article.update!(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

# Delete a single article from the database
  def destroy
    @article.destroy
    redirect_to articles_path
  end

# strong params
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def set_article
      @article = Article.find(params[:id])
    end
  end
