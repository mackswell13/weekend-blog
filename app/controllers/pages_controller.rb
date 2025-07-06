class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    authenticated?
    @resume_bullets = ResumeBullet.order(created_at: :desc).limit(5)
    @blogs = Blog.order(created_at: :desc).limit(5)
    @links = LinkedBlog.order(created_at: :desc).limit(5)
    @is_admin = Current.user.is_admin
  end
end
