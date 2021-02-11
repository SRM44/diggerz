module UserHelper
  def current_user_avatar_path
    user_avatar_path(current_user)
  end

  def user_avatar_path(user)
    if user.avatar.url.nil?
      image_path 'default_profile.png'
    else
      cl_image_path user.avatar
    end
  end
end
