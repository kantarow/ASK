module UsersHelper
  def user
    return @user if defined? @user
    @user = User.find_by(id_name: params[:user_id])
  end
end
