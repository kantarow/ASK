class SessionsController < ApplicationController
  def new
  end

  def create
    id_name_or_email = session_params[:id_name_or_email]
    user = User.find_by(id_name: id_name_or_email) || User.find_by(email: id_name_or_email)
    p user
    if user.authenticate(session_params[:password])
      session[:user_id] = user.id_name
      flash.now[:success] = "Log in success"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid ID or Email or Password"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

  private

    def session_params
      params.require(:session).permit(:id_name_or_email, :password)
    end
end
