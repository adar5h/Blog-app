class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :update, :edit, :destroy]
    skip_before_action :verify_authenticity_token


    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def create
        # debugger
        # @article = Article.new(params[:article]) // Wrong way to create a article, use strong params instead.
        @article = Article.new(article_params)
        # @article.user = User.first #Assigning user to each newly created article
        @article.user = current_user # Assigning user to the current user
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
    end

    def update  
        if @article.update(article_params)
            flash[:notice] = "Article has been updated"
            redirect_to @article
        else
            render "edit"
        end
    end

    def destroy
        @article.destroy
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end
