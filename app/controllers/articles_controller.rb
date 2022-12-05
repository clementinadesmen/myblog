class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title,:description))
        if @article.save
            flash[:notice] = "Article crée avec succés"
            redirect_to @article   
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to articles_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path, status: :see_other
    end

    private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end