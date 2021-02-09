module Discogs
  class ImportUserCollection
    attr_reader :user
    attr_accessor :status

    def initialize(params = {})
      @user            = params[:user]
      @diggerz_release = params[:release]
      @errors          = []
    end

    def call
      fetch_user_vinyls_from_discogs

      @discogs_releases.each do |discogs_release|
        create_diggerz_release_and_record(discogs_release)
      end

      return @errors
    end

    private

    def fetch_user_vinyls_from_discogs
      @discogs_releases = discogs_wrapper.get_user_collection(@user.username).releases.select do |discogs_release|
        discogs_release.basic_information.formats.first.name == "Vinyl"
      end
    end

    def create_diggerz_release_and_record(discogs_release)
      release_params = {
        title:      discogs_release.basic_information.title,
        artist:     discogs_release.basic_information.artists.first.name,
        discogs_id: discogs_release.id,
        genre:      Genre.first,
        year:       discogs_release.basic_information.year,
        label:      discogs_release.basic_information.labels.first.name
      }

      diggerz_release = Release.find_or_initialize_by(release_params)

      begin
        unless diggerz_release.persisted?
          diggerz_release.remote_image_url = discogs_release.basic_information.cover_image
        end

        diggerz_release.save!

        Record.find_or_create_by!(user: user, release: diggerz_release)
      rescue
        @errors << {
          name:    :import,
          status:  :failed,
          record:  discogs_release.basic_information,
          message: "n'a pas été importé"
        }
      end

    end

    def discogs_wrapper
      @discogs_wrapper ||= Discogs::Wrapper.new(
        "Diggerz",
        access_token: Discogs::UserAuth.new(user).access_token
      )
    end
  end
end

# Unused methods

# class ImportFromDiscogsService
#   def initialize(params = {})
#     @user            = params[:user]
#     @diggerz_release = params[:release]
#   end

#   def import_user_data
#     @diggerz_user = discogs_wrapper.get_user(@user.username)

#     user_params = {
#       location:   @diggerz_user.location,
#       discogs_id: @diggerz_user.id,
#       username:   @diggerz_user.username,
#       name:       @diggerz_user.name,
#       email:      @diggerz_user.email
#     }

#     @user.update_attributes(user_params)
#     @user.remote_avatar_url = @diggerz_user.avatar_url

#     @user.save
#   end

#   def import_record_data
#     @discogs_release = discogs_wrapper.get_release(@diggerz_release.discogs_id)

#     @discogs_release.tracklist.each do |track|
#       @diggerz_release.tracks.create!({
#         position: track.position,
#         title:    track.title.strip,
#       })
#     end

#     genre = Genre.new(name: @discogs_release.genres.first)

#     if genre.save
#       @diggerz_release.genre = genre
#     else
#       @diggerz_release.genre = Genre.find_by(name: @discogs_release.genres.first)
#     end

#     @diggerz_release.save
#   end
# end
