class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update , :destroy]

    def show
    end

    def index
        #@articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 3)
    end

    def edit
    end

    def new
        @article = Article.new
    end

    def create
        #displays article params in json format on the browser
        #render plain:params[:article]

        @article = Article.new(article_params)
        @article.user = User.first

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
        if @article.update(article_params)
            flash[:notice] = "Article was Updated successfully" 
        else
            render 'edit'
        end
    end
    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end
    def article_params
        params.require(:article).permit(:title, :description)
    end
end
