module Mydeals
  skip_before_action :redirect_user_without_confirmed_email!
  class InProgressController < ApplicationController
    def index
      @requested_deals = current_user.
        requested_deals.
        in_progress.
        by_most_recent

      @received_deals  = current_user.
        received_deals.
        in_progress.
        by_most_recent
    end
  end
end
