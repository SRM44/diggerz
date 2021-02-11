module Account
  class LocationController < ApplicationController
    skip_before_action :redirect_user_without_confirmed_email!

    def edit
      @location            = current_user.location
      @available_locations = User::Location.available
    end

    def update
      current_user.update location: params[:user][:location]
      redirect_to redirection_path
    end

    private

    def redirection_path
      params[:just_registered].present? ? new_myrecord_path(just_registered: true) : profile_path
    end
  end
end
