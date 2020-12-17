module MydealsHelper
  def active_nav_link_class(link_path, current_path)
    link_path == current_path ? "active" : nil
  end

  def mydeals_return_url
    params[:mydeals_return_url]
  end
end
