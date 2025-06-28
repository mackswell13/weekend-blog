class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(created_at: :desc).limit(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
