class Users::ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(resource_name, resource)
    user_signed_in? ? profile_path : super
  end
end
