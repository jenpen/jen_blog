class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

# Takes us to the template that renders a view of articles/new
  def new
  end

# Saves the information from the form into the database
  def create
    @article = Article.new(article_params)

    @article.save!
    redirect_to @article
  end

# strong params
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  end
