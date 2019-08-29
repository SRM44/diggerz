module ApplicationHelper
  def current_user_avatar_path
    if current_user.avatar.url.nil?
      image_path 'default_profile.jpg'
    else
      cl_image_path current_user.avatar
    end
  end

  def default_genre_image_path(genre)
    filename = genre.name.parameterize

    if Genre::SAVED_IMAGE_GENRES.include?(filename)
      image_path "#{filename}.jpg"
    else
      image_path 'default_genre.jpg'
    end
  end
end
