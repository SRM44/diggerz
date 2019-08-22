class ImportFromDiscogsService
  def initialize(discogs, params = {})
    @discogs = discogs
    @user = params[:user]
    @diggerz_release = params[:release]
  end

  def import_record_data
    @discogs_release = @discogs.get_release(@diggerz_release.discogs_id)
    @discogs_release.tracklist.each do |track|
      track_params = {
        position: track.position,
        title: track.title
      }
      diggerz_track = @diggerz_release.tracks.new(track_params)
      diggerz_track.save
    end

    genre = Genre.new(name: @discogs_release.genres.first)
    if genre.save
      @diggerz_release.genre = genre
    else
      @diggerz_release.genre = Genre.find_by(name: @discogs_release.genres.first)
    end
    @diggerz_release.save
    end

  def import_collection
    @releases = @discogs.get_user_collection(@user.username).releases

    @releases.each do |discogs_release|
      next unless discogs_release.basic_information.formats.first.name == "Vinyl"

      release_params = {
        title: discogs_release.basic_information.title,
        artist: discogs_release.basic_information.artists.first.name,
        discogs_id: discogs_release.id,
        genre: Genre.first,
        year: discogs_release.basic_information.year,
        label: discogs_release.basic_information.labels.first.name,
      }

      diggerz_release = Release.find_by(discogs_id: discogs_release.id)

      if diggerz_release.nil?
        diggerz_release = Release.new(release_params)
        diggerz_release.remote_image_url = discogs_release.basic_information.cover_image
      else
        diggerz_release.update_attributes(release_params)
      end

      return false unless diggerz_release.save

      next if Record.find_by(user: @user, release: diggerz_release)

      record = Record.new(
        user: @user,
        release: diggerz_release
      )
      return false unless record.save
    end
    return true
  end
end
