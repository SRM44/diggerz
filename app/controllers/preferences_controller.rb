class PreferencesController < ApplicationController

  def edit
    @genres = Genre.all
  end

  def update
    current_user.preferences.destroy_all
    params[:genre_id].each do | id |
      current_user.preferences.create(genre_id: id)
    end
  end
end
