class PagesController < ApplicationController
  def home
    @admin = Current.user.is_admin
    @blogs = Blog.first(10)
  end
end
