class NewAppDesignController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!
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
