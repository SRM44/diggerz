class PagesController < ApplicationController
  skip_before_action :authenticate_user!,                     only: [:home]
  skip_before_action :redirect_user_without_confirmed_email!, only: [:home]

  def home
  end
end
