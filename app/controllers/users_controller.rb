class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update,  :destroy]
  before_action :user_exists?,  only: [:show, :edit ]
  helper_method :user

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
  end

  def update
    if user.update_attributes(user_params)
      flash[:success] = "User updated" 
      redirect_to user
    else
      flash[:danger] = "Failed to update"
      render 'edit'
    end
  end

  def destroy
    if user.destroy
      flash[:success] = "Your account deleted"
    else
      flash[:danger] = "Failed to delete account"
    end
    redirect_to root_url
  end


  def follow
    if current_user.following?(user)
      current_user.unfollow!(user)
      @message = "Follow".to_json
    else
      current_user.follow!(user)
      @message = "Unfollow".to_json
    end
  end

  def user
    if defined? @user
      return @user
    else
      puts "SQL"
      @user = User.find_by(id_name: params[:user_id])
    end
  end

  def user_exists?
    unless user
      flash[:danger] = "User not found"
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:id_name, :screen_name, :email, :password, :password_confirmation)
  end
end
