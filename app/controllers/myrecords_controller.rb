class MyrecordsController < ApplicationController
  before_action :set_discogs, only: [:show, :import_from_discogs]
  def index
    if params[:query].present?
      sql_query = <<~SQL
        title @@ :query
        OR artist @@ :query
      SQL
      @myrecords = current_user.records.joins(:release).where(sql_query, query: "%#{params[:query]}%")
    else
      @myrecords = current_user.records
    end
  end

  def show
    @record = Record.find(params[:id])

    if @record.release.tracks.empty?
      ImportFromDiscogsService.new(@discogs, release: @record.release).import_record_data
    end
  end

  def import_from_discogs
    imported = ImportFromDiscogsService.new(@discogs, user: current_user).import_collection

    if imported
      redirect_to myrecords_path, notice: "Succesfully imported Discogs' collection"
    else
      redirect_to myrecords_path, alert: "Something went wrong"
    end
    # <%= link_to 'Importer ma collection', import_from_discogs_releases_path %>
  end

  def toggle_swappable
    @record = Record.find(params[:id])

    @record.swappable = !@record.swappable

    if @record.save
      respond_to do |format|
        format.html { redirect_to myrecords_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'myrecords/index' }
        format.js  # <-- idem
      end
    end
  end

  private

  def set_discogs
    @discogs = Discogs::Wrapper.new("Diggerz", access_token: session[:access_token])
  end
end
