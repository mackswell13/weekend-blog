class LinkedBlogsController < ApplicationController
  before_action :set_link, only: [ :destroy ]

  def index
    @links = LinkedBlog.order(created_at: :desc).limit(5)
  end

  def new
    @link = LinkedBlog.new
  end

  def create
    @link = LinkedBlog.new(blog_params)
    if @link.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to linked_blogs_path
  end

  private

  def set_link
    @link = LinkedBlog.find(params[:id])
  end

  def blog_params
    params.require(:linked_blog).permit(:title, :href)
  end
end
