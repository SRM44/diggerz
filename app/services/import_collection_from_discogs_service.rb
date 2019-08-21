class ImportCollectionFromDiscogsService
  def initialize(user, discogs)
    @user = user
    @discogs = discogs
  end

  def call
    @releases = @discogs.get_user_collection(@user.username).releases

    @releases.each do |discogs_release|
      diggerz_release = Release.find_by(discogs_id: discogs_release.id)
      binding.pry

      if diggerz_release.nil?
        diggerz_release = Release.new(
          title: discogs_release.basic_information.title,
          artist: discogs_release.basic_information.artists.first.name,
          discogs_id: discogs_release.id,
          genre: Genre.find
        )
        diggerz_release.save
      end

      if diggerz_release.persisted?
        record = Record.find_by(user: @user, release: diggerz_release)
        if record.nil?
          record = Record.new(
            user: @user,
            release: diggerz_release
          )
          record.save
        end
      end
    end
  end
end
