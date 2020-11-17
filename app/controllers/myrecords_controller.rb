class MyrecordsController < ApplicationController
  before_action :set_discogs, only: [:show, :import_from_discogs]
  skip_before_action :redirect_user_without_confirmed_email!, only: [:new, :create, :index, :show, :import_from_discogs]

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

    # Here the release has no `discogs_id`, so in ImportFromDiscogsService this line fails
    # @discogs_release = @discogs.get_release(@diggerz_release.discogs_id)

    # Need to discuss what to do here

    # if @record.release.tracks.empty?
    #   ImportFromDiscogsService.new(@discogs, release: @record.release).import_record_data
    # end
  end

  def import_from_discogs
    imported = ImportFromDiscogsService.new(@discogs, user: current_user).import_collection

    if imported
      redirect_to myrecords_path, notice: "L'importation de vos vinyles depuis Discogs est terminée ! Sélectionnez les vinyles que vous souhaitez échanger avec d'autres utilisateurs"
    else
      redirect_to myrecords_path, alert: "L'importation de vos vinyles a échoué"
    end
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

  def release_params
    params.require(:release).permit(:title, :image, :artist, :label, :year, :genre)
  end

end
