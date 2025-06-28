class PagesController < ApplicationController
  def home
    @admin = Current.user.is_admin
    @blogs = Blog.order(created_at: :desc).limit(5)
  end
end
