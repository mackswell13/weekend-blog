class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_is_admin

  private

  def set_is_admin
    @is_admin = Current.user.is_admin
  end
end
