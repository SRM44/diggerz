class MyrecordsController < ApplicationController
  def index
    @records = current_user.records
  end

  def import_from_discogs
    @discogs = Discogs::Wrapper.new("Diggerz", session[:access_token])

    ImportCollectionFromDiscogsService.new(current_user, @discogs).call

    # redirect_to myrecords_path, notice: "Succesfully imported Discogs' collection"
    # <%= link_to 'Importer ma collection', import_from_discogs_releases_path %>
  end
end
