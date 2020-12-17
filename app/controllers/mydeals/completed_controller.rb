module Mydeals
  skip_before_action :redirect_user_without_confirmed_email!
  class CompletedController < ApplicationController
    def index
      @deals = current_user.requested_deals.completed.by_most_recent
    end
  end
end
