class UsersController < ApplicationController
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

  def destroy
    @user = User.find_by(id_name: params[:id])
  end

  private
  
    def user_params
      params.require(:users).permit(:id_name, :screen_name, :email, :password, :password_confirmation)
    end
end
