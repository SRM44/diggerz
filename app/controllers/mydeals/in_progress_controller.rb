module Mydeals
  class InProgressController < ApplicationController
    def index
      @deals = current_user.requested_deals.accepted.by_most_recent
    end
  end
end
