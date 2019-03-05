module ItemsHelper
  def item
    return @item if defined? @item
    user
    @item = Item.find_by(id: params[:item_id])
  end
end
