class ArticlesController < ApplicationController
  def index
    render locals: { articles: Article.all }
  end

  def show
    render locals: { article: Article.find(params[:id]) }
  end
end
