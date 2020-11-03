module RecordHelper
  def record_cover_path(record)
    record.release.image.url || record.pictures&.first&.photo&.url || "discogs vinyl record mark.png"
  end
end
