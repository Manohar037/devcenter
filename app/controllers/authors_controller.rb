# frozen_string_literal: true

# Authors controller to navigate
class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    # @author = Author.find(params[:id])
    @author = current_author
    @articles = @author.articles
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def showeach
    @author = Author.find(params[:format])
    @articles = @author.articles
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to authors_path
    else
      render 'edit'
    end
  end

  def search1
    @authors = Author.where('author_name LIKE ?',
                            '%' + params[:authorname] + '%')
    # @author = Author.find(params[:id])
    # @articles = @author.articles
  end

  def destroy
    @author_name = Author.find(params[:id])
    @author_name.destroy

    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:author_name)
  end
end
