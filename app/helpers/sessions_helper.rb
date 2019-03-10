module SessionsHelper
  include UsersHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    return @current_user if defined? @current_user
    @current_user = User.find_by(id_name: session[:user_id])
    if @current_user.nil?
      user = User.find_by(id_name: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        @current_user = User.find_by(id_name: cookies.signed[:user_id])
        log_in @current_user
      end
    end
    @current_user
  end
end
