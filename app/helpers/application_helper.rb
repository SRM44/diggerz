module ApplicationHelper
  def current_user_avatar_path
    if current_user.avatar.url.nil?
      image_path 'default_profile.jpg'
    else
      cl_image_path current_user.avatar
    end
  end
end
