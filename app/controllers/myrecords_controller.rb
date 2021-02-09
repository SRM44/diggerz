class MyrecordsController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:new, :create, :index, :show, :import_from_discogs, :toggle_swappable]

  def index
    @myrecords = current_user.records.joins(:release)

    query = params.dig(:search, :query)
    if query.present?
      @myrecords = @myrecords.for_query(query)
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def import_from_discogs
    errors = Discogs::ImportUserCollection.new(user: current_user).call

    if errors.any?
      redirect_to myrecords_path, alert: import_failed_alert(errors)
    else
      redirect_to myrecords_path, notice: "L'import de vos vinyles depuis Discogs est terminé 🎉"
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

  def import_failed_alert(errors)
    "L'import #{errors.count} de vos vinyles a échoué ❌"
  end

  def release_params
    params.require(:release).permit(:title, :image, :artist, :label, :year, :genre)
  end

end
