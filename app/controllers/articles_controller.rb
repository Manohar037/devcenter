class ArticlesController < ApplicationController

	def index
    		@articles = Article.all
  	end
	
	def new
	end
	
	def create
  		#render plain: params[:article].inspect
		#@article = Article.new(params[:article])
		@article = Article.new(params.require(:article).permit(:title, :text, :author))

 
  		@article.save
  		redirect_to @article
	end
	
	def show
   		 @article = Article.find(params[:id])
  	end
end
