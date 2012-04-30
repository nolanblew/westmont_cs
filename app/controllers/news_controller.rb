class NewsController < ApplicationController
  before_filter :is_user_signed_in, :only => [:new, :create, :edit, :update, :destroy]

  def new
    @news = News.new
    @news.front_page = true
    if (News.count > 0)
    @news.alias = "article_" + (News.last.id + 1).to_s
    else
      @news.alias = "article_1"
      end
    @method = "Add"
    render 'modify'
  end

  def create
    @news = News.new(params[:news])
    @news.created_by = current_user.id
    if @news.save
      redirect_to "/administrator/news"
    else
      @method = "Add"
      render 'modify'
    end
  end

  def edit
    @news = News.find(params[:id])
    if !@news.nil?
      @method = "Update"
      render 'modify'
    else
      redirect_to "/administrator/news"
    end
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      redirect_to "/administrator/news"
    else
      @method = "Update"
      render 'modify'
    end
  end

  def destroy
    @news = News.find(params[:id])
    if !@news.nil?
      @news.destroy
    end
    redirect_to "/administrator/news"
  end


  def show

  end

  def list

  end


  private

  def is_user_signed_in
    is_signed_in?
  end

end
