class ItemsController < ApplicationController
  include ApplicationHelper
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_exists?,   only: [:show, :edit ]
  helper_method :item

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    toggle_mode do
      if @item.save
        flash[:success] = "Item posted"
        redirect_to root_url
      else
        render 'new'
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    toggle_mode do
      if item.update_attributes(item_params)
        flash[:success] = "Item updated"
        redirect_to item_path(@item)
      else
        flash[:danger] = "Failed to update"
        render 'edit'
      end
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

  def like
    p params[:test]
    if current_user.like?(item)
      current_user.unlike!(item)
      @src = "https://img.icons8.com/material-outlined/24/000000/hearts.png".to_json
    else
      current_user.like!(item)
      @src = "https://img.icons8.com/material/24/000000/hearts.png".to_json
    end
  end

  def toggle_mode
    @title   = params[:item][:title]
    @content = params[:item][:content]
    @slidable_check = params[:item][:slidable]
    case params[:commit]
    when "Submit"
      yield
    when "Edit"
      @visible = "#editmode"
      @hidden = "#previewmode"
      render "toggle_mode"
    when "Preview"
      @visible = "#previewmode"
      @hidden = "#editmode"
      render "toggle_mode"
      p md2html(@content)
    end
  end

  def change_type
  end

  def item
    return @item if defined? @item
    @item = Item.find_by(id: params[:item_id])
  end

  def item_exists?
    unless item
      flash[:danger] = "Item not found"
      redirect_to root_url
    end
  end


  private

  def item_params
    params.require(:item).permit(:title, :content, :slidable)
  end

end
