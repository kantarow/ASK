module SessionsHelper
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

  def current_user
    if (user_id = session[:user_id])
      begin
      rescue ActiveRecord::RecordNotFound
        session.delete(:user_id)
        @current_user = nil
      end
    elsif (user_id = cookies.signed[:user_id])
      begin
        user = User.find(user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      rescue ActiveRecord::RecordNotFound
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
        @current_user = nil
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
