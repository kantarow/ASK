class UsersController < ApplicationController
  include SessionsHelper
  before_action :require_login, only: [:edit, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id_name: params[:id])
  end

  def index
    @user = User.find_by(id_name: params[:id])
  end

  def edit
    @user = User.find_by(id_name: params[:id])
  end

  def update
    @user = User.find_by(id_name: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User updated" 
      redirect_to root_url
    else
      flash[:danger] = "Failed to update"
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id_name: params[:id])
    @user.destroy
    flash[:success] = "Your account deleted"
    redirect_to root_url
  end

  private
  
    def user_params
      params.require(:user).permit(:id_name, :screen_name, :email, :password, :password_confirmation)
    end

    def require_login
      unless logged_in?
        flash[:warning] = "Please Log in"
        redirect_to login_url
      end
    end
end
