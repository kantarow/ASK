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
  end

  def index
  end

  def destroy
  end

  private
  
    def user_params
      params.require(:user).permit(:id_name, :screen_name, :email, :password, :password_confirmation)
    end
end
