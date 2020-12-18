class MydealsController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!

  before_action :set_deal, only: [:show]

  def show
    @proposed_record = @deal.requester_record
    @asked_record    = @deal.receiver_record

    @current_user_received_deal = @asked_record.user == current_user
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end
end
