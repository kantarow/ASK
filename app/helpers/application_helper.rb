module ApplicationHelper
  def find_item
    redirect_to root_url unless (@item = Item.find_by(id: params[:item_id]))
  end
  def find_user
    redirect_to root_url unless (@user = User.find_by(id_name: params[:user_id]))
  end
  def md2html(text)
    html = CommonMarker.render_html(text)
    raw(html)
  end
end
