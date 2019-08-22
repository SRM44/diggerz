class ImportCollectionFromDiscogsService
  def initialize(discogs, params = {})
    @discogs = discogs
    @user = params[:user]
    @release = params[:release]
  end

  def import_release_data

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
        label: discogs_release.basic_information.labels.first.name
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
