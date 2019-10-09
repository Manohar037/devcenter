class ArticlesController < ApplicationController

	def index
    		@articles = Article.all
        #render inline: "<% @articles.each do |article| %>
          #<%= article.title %> <% end %>"
  	end

  	def show
   		 @article = Article.find(params[:id])
       #redirect_to @article
       #render 'new'
  	end
	
	def new
		@article=Article.new
	end
	
	def edit
 	    @article = Article.find(params[:id])

	end

	def create
    
  		#render plain: params[:article].inspect
		#@article = Article.new(params[:article])
		@article = Article.new(article_params)

 
  		if @article.save
  			redirect_to @article
  		else
  			render 'new'
  		end

	end
	
	

  	def update
  		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to articles_path
  		else
    		render 'edit'
  		end
	end

  def search
    @articles = Article.where("title LIKE ?","%"+params[:titlename]+"%")
  end

	def destroy
    	@article = Article.find(params[:id])
   	    @article.destroy
 
    	redirect_to articles_path
  	end
 
	private
  		def article_params
    		params.require(:article).permit(:title, :text, :text_chars_count)
  		end
end
