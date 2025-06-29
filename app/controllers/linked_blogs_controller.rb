class LinkedBlogsController < ApplicationController
  before_action :set_blog, only: [ :show, :edit, :update, :destroy ]

  def index
    @links = Blog.order(created_at: :desc).limit(5)
  end

  def show
  end

  def new
    @link = Blog.new
  end

  def create
    @link = Blog.new(blog_params)
    if @link.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update(blog_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to blogs_path
  end

  private

  def set_blog
    @link = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :link)
  end
end
