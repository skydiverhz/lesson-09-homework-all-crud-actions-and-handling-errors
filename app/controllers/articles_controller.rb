class ArticlesController < ApplicationController
  
  def index
      # list of all articles (articles)
     @articles = Article.all
  end

  def show
     @article = Article.find(params[:id])
  end

  def new
    # form to add a new article
    @article = Article.new
  end

  def create
    # using data from "new: form -creates the new article record
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Your article was created!"
    # redirects to the index list (view)
      redirect_to articles_path(@article)
    else
      # goes back to new form
      render :new
      # article creation failed
      flash[:notice] = "Error! Please try again!"
    end
  end

  def edit
    # uses the articles id to find the record
    @article = Article.find(params[:id])
  end

  def update
    # uses the id from the url to find the record
    @article = Article.find(params[:id])
    # changes the article record from the edit form
    if @article.update(article_params)
      flash[:notice] = "Your article was updated!"
    # redirects to the show page with the updated record
      redirect_to article_path(@article)
    else
      flash.now[:error] = "An error prevented the article from being updated"
      render :edit      
    end
  end

  def destroy
    # deletes a article
    @article = Article.find(params[:id])
    # deletes the resource
    @article.destroy
    # flash[:notice] = "Your article was deleted!"
    # send to index (list) view
    redirect_to articles_path 
  end

  def delete
    @article = Article.find(params[:id])
  end

  private

  
  def article_params
    # defines the only allowed attributes
    params.require(:article).permit(:article_name, :first_name,:last_name, :universe, :bio)
  end

end
