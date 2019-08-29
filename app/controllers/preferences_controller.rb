class PreferencesController < ApplicationController

  def edit
    @genres = Genre.all
    @user_genres = current_user.genres.to_a # prevent call to ActiveRecord#include?
  end

  def update
    # current_user.preferences.destroy_all
    # params[:genre_id].each do | id |
    #   current_user.preferences.update(genre_id: id)
    # end
    current_user.update(genre_ids: params[:genre_id])
    redirect_to edit_profile_preferences_path
    end
end
