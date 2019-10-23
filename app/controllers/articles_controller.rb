# frozen_string_literal: true

# Articles controller
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    # @article=Article.find(params[:id])
    # @author=Article.find(params[:author_id])
    # render inline: "<% @articles.each do |article| %>
    # <%= article.title %> <% end %>"
  end

  def show
    @article = Article.find(params[:id])
    @author = Author.find(params[:author_id])
    # redirect_to @article
    # render 'new'
  end

  
  def new
    @article = Article.new
    @author = Author.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  #   def create
  #
  #       #render plain: params[:article].inspect
  #     #@article = Article.new(params[:article])
  #
  #     #@author = Author.find(params[:article][:author][:author_id])
  #     #@author.articles.create(article_params)
  #
  #     @article = Article.new(article_params)
  #     @author = Author.new(author_params)
  #       if @article.save && @author.save
  #         redirect_to @article
  #       else
  #         render 'new'
  #       end
  #   end
  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to author_articles_path
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to author_articles_path
    else
      render 'edit'
    end
  end

  def search2
    @articles = Article.where('title LIKE ?',
                              '%' + params[:titlename] + '%')
  end

  def destroy
    # @article = Article.find([params[:id],params[:author_id]])
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to author_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :aut_name, :text_chars_count)
  end

  def author_params
    params.require(:author).permit(:author_name)
  end
end
