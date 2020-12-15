module Mydeals
  class CompletedController < ApplicationController
    def index
      @deals = current_user.requested_deals.completed.by_most_recent
    end
  end
end
