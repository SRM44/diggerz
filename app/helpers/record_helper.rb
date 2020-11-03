module RecordHelper
  def record_cover(record)
    return record.release.image.url || record.pictures&.first&.photo&.url || image_path("discogs vinyl record mark.png")
  end
end
