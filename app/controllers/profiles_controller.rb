class ProfilesController < ApplicationController
  before_action :set_discogs, only: [:show, :import_from_discogs]

  def show
    unless current_user.avatar.url
      ImportFromDiscogsService.new(@discogs, user: current_user).import_user_data
      redirect_to profile_path
    end
    @user = current_user
  end

  def import_from_discogs
    imported = ImportFromDiscogsService.new(@discogs, user: current_user).import_user_data
  end

  private

  def set_discogs
    @discogs = Discogs::Wrapper.new("Diggerz", access_token: session[:access_token])
  end
end
