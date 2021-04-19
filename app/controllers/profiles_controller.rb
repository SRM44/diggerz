class ProfilesController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:show]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(current_user_params)

    redirect_to profile_path
  end

  private

  def current_user_params
    params.require(:user).permit(:name, :username, :email, :phone_number)
  end
end
