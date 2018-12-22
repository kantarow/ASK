module UsersHelper
  def current_user
    id_name = session[:user_id]
    id_name && User.find_by(id_name: id_name)
  end

  def logged_in?
    !current_user.nil?
  end
end
