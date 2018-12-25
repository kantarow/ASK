class ApplicationController < ActionController::Base
  def require_login
    unless logged_in?
      flash[:warning] = "Please Log in"
      redirect_to login_url
    end
  end
end
