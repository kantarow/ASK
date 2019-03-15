module ApplicationHelper
  def md2html(text)
    html = CommonMarker.render_html(text)
  end
end
