class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def edit
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        #displays article params in json format on the browser
        #render plain:params[:article]

        @article = Article.new(params.require(:article).permit(:title, :description))
        #shows the articles object in the browser
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article was saved Successfully."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was Updated successfully" 
        else
            render 'edit'
        end
    end
    def destroy
        @article = Article.find(params[:id]
        )
        @article.destroy
        redirect_to articles_path
    end
end
