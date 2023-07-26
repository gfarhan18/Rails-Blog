class ArticlesController < ApplicationController

    def show
        @article=Article.find(params[:id])
    end
    
    def index
        @articles= Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
          flash[:success] = "Article successfully created"
        redirect_to @article    
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
          flash[:success] = "Article was successfully updated"
          redirect_to @article
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            flash[:success] = 'Article was successfully deleted.'
            redirect_to articles_path
        else
            flash[:error] = 'Something went wrong'
            redirect_to articles_path
        end
    end
    
    

end