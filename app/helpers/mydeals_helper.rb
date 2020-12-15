module MydealsHelper
  def active_nav_link_class(link_path, current_path)
    link_path == current_path ? "active" : nil
  end
end
