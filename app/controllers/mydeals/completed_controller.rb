module Mydeals
  class CompletedController < ApplicationController
    skip_before_action :redirect_user_without_confirmed_email!

    def index
      @requested_deals = current_user.
        requested_deals.
        completed_or_canceled.
        by_most_recent

      @received_deals  = current_user.
        received_deals.
        completed_or_canceled.
        where.not(id: @requested_deals.map(&:id)).
        by_most_recent
    end
  end
end
