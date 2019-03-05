class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  helper_method :item
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

  def show
  end

  def edit
  end

  def update
    if item.update_attributes(item_params)
      flash[:success] = "Item updated"
      redirect_to item_path(@item)
    else
      flash[:danger] = "Failed to update"
      render 'edit'
    end
  end

  def destroy
    if item.destroy
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

end
