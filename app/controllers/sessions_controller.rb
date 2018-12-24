class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    id_name_or_email = session_params[:id_name_or_email]
    @user = User.find_by(id_name: id_name_or_email) || User.find_by(email: id_name_or_email)

    if @user && @user.authenticate(session_params[:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      flash.now[:success] = "Log in success"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email/id/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def session_params
      params.require(:session).permit(:id_name_or_email, :password)
    end
end
