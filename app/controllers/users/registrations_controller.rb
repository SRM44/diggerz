module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      super do |user|
        if user.valid?
          sign_in user
        end
      end
    end

    private

    def after_sign_up_path_for(resource)
      edit_account_location_path
    end

    def sign_up_params
      params.require(:user).permit(:first_name, :email, :password, :accepts_marketing_communications, :accepts_tos)
    end
  end
end
