class ProfilesController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:show]
  before_action :set_discogs, only: [:show, :import_from_discogs]

  def show
    unless current_user.avatar.url
      ImportFromDiscogsService.new(@discogs, user: current_user).import_user_data
      redirect_to profile_path
    end

    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(current_user_params)

    redirect_to profile_path
  end

  def import_from_discogs
    imported = ImportFromDiscogsService.new(@discogs, user: current_user).import_user_data
  end

  private

  def set_discogs
    @discogs = Discogs::Wrapper.new("Diggerz", access_token: session[:access_token])
  end

  def current_user_params
    params.require(:user).permit(:name, :username, :email)
  end
end
