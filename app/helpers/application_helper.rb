module ApplicationHelper
  def find_item
     unless (@item = Item.find_by(id: params[:item_id]))
       redirect_to root_url
       flash[:warning] = "Cannot find the item"
       return nil
     end
  end
  def find_user
    unless (@user = User.find_by(id_name: params[:user_id]))
       redirect_to root_url
       flash[:warning] = "Cannot find the user"
       return nil
    end
  end
  def md2html(text)
    html = CommonMarker.render_html(text)
    raw(html)
  end
end
