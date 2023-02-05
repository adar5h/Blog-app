class ArticlesController < ApplicationController
    def index
       render html: "HOME", status: :ok 
    end

    def show
            @article = Article.find(params[:id])
    end
end
