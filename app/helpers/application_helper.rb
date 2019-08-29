module ApplicationHelper
  def current_user_avatar_path
    if current_user.avatar.url.nil?
      image_path 'default_profile.png'
    else
      cl_image_path current_user.avatar
    end
  end

  def default_genre_image_path(genre)
    if Genre::SAVED_IMAGE_GENRES.include?(genre.name.downcase)
      image_path "#{genre.name.downcase}.jpg"
    else
      image_path 'default_genre.jpg'
    end
  end
end
