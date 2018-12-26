class UsersController < ApplicationController
  include SessionsHelper
  before_action :require_login, only: [:edit, :update,  :destroy]
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
    find_user
  end

  def index
  end

  def edit
    find_user
  end

  def update
    find_user
    if @user.update_attributes(user_params)
      flash[:success] = "User updated" 
      redirect_to user_path(@user)
    else
      flash[:danger] = "Failed to update"
      render 'edit'
    end
  end

  def destroy
    find_user
    if @user.destroy
      flash[:success] = "Your account deleted"
    else
      flash[:danger] = "Failed to delete account"
    end
    redirect_to root_url
  end

  def items
    find_user
    @items = @user.items
  end

  private
  
    def user_params
      params.require(:user).permit(:id_name, :screen_name, :email, :password, :password_confirmation)
    end

    def find_user
      print("nil param") if params[:id].nil?
      @user = User.find(params[:id])
    end
end
