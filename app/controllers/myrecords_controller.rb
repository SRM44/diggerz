class MyrecordsController < ApplicationController
  before_action :set_discogs, only: [:show, :import_from_discogs]

  def index
    @records = current_user.records.includes(:release)
  end

  def show
    @record = Record.find(params[:id])

    if @record.release.tracks.empty?
      ImportReleaseDataFromDiscogs.new(@discogs, release: @record.release).import_release_data
    end
  end

  def import_from_discogs
    imported = ImportCollectionFromDiscogsService.new(@discogs, user: current_user).import_collection

    if imported
      redirect_to myrecords_path, notice: "Succesfully imported Discogs' collection"
    else
      redirect_to myrecords_path, alert: "Something went wrong"
    end
    # <%= link_to 'Importer ma collection', import_from_discogs_releases_path %>
  end

  private

  def set_discogs
    @discogs = Discogs::Wrapper.new("Diggerz", access_token: session[:access_token])
  end
end
