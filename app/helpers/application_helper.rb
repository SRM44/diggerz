module ApplicationHelper
  def link_to_add_row(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

  def record_thumb_pic(record)
    record.release.image.url.nil? ? record.pictures.first.photo : record.release.image
  end

  def current_user_avatar_path
    if current_user.avatar.url.nil?
      image_path 'default_profile.png'
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
