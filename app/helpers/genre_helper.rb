module GenreHelper
  def default_genre_image_path(genre)
    filename = genre.name.parameterize

    if Genre::SAVED_IMAGE_GENRES.include?(filename)
      image_path "#{filename}.jpg"
    else
      image_path 'default_genre.jpg'
    end
  end
end
