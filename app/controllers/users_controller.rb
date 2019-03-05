class UsersController < ApplicationController
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
    @items = user.items.paginate(page: params[:page], per_page: 5)
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


  def follow
    find_user
    if current_user.following?(@user)
      current_user.unfollow!(@user)
      @message = "Follow".to_json
    else
      current_user.follow!(@user)
      @message = "Unfollow".to_json
    end
  end

  private

  def user_params
    params.require(:user).permit(:id_name, :screen_name, :email, :password, :password_confirmation)
  end
end
