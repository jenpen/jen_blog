class ArticlesController < ApplicationController
# Takes us to the template that renders a view of articles/new
  def new
  end

# Saves the information from the form into the database
  def create
    render plain: params[:article].inspect
  end

end
