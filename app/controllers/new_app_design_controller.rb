class NewAppDesignController < ApplicationController
    skip_before_action :authenticate_user!
    def session
    end
    def registration
    end
    def localisation
    end
    def home
    end
    def deals_page
    end
    def show_deal_sent
    end
    def show_deal_pending
    end
    def show_deal_validated
    end
    def show_deal_validated_one_confirmation
    end
    def show_deal_over
    end
    def show_deal_cancelled
    end
    def forgot_password
    end
end
