class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def create
        # debugger
        # @article = Article.new(params[:article]) // Wrong way to create a article, use strong params instead.
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Your Article was Created"
            redirect_to @article
        else
            render 'new', status: :unprocessable_entity
            puts 'error creating article' 
        end
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update  
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article has been updated"
            redirect_to @article
        else
            render "edit"
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    end

end
