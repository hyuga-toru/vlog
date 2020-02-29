class ArticlesController < ApplicationController
  #before_action :authenticate_user!
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.order(created_at: :desc)
    @articles = Article.all.page(params[:page]).per(10)
  end

  def show
    #@article.user_id = current_user.id
    #@comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit
  end
  
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
    end
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article, notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end
  
  def destroy
    if @article.destroy
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_path, alert: '削除できませんでした'
    end
  end
  
  private
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:name, :place, :start_time, :end_time, :content, :image)
  end
  
  def validate_user
    if @article.user != current_user
      redirect_to root_path
    end
  end 
end
