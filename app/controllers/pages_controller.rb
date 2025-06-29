class PagesController < ApplicationController
  def home
    @blogs = Blog.order(created_at: :desc).limit(5)
  end
end
