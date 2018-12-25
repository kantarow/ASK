class ItemsController < ApplicationController
  include SessionsHelper
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item posted"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    find_item
  end

  def update
    find_item
    if @item.update_attributes(user_params)
      flash[:success] = "Item updated"
      redirect_to item_path(@item)
    else
      flash[:danger] = "Failed to update"
      render 'edit'
    end
    end
  end

  def destroy
    find_item
    if @item.destroy
      flash[:success] = "Item deleted"
    else
      danger[:danger] = "Failed to delete item"
    end
    redirect_to root_url
  end

  private
  
    def item_params
      params.require(:item).permit(:title, :content)
    end

    def find_item
      @item = Item.find(params[:id])
    end
end
