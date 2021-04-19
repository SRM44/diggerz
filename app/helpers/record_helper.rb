module RecordHelper
  def record_cover(record)
    return record&.pictures&.last&.photo&.url || record&.release&.image&.url || image_path("discogs vinyl record mark.png")
  end
end
