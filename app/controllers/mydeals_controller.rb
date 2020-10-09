class MydealsController < ApplicationController
  before_action :set_deal, only: [:show]


  def index
    @received_deals = []
    @sended_deals = []
    @accepted_deals = []
    @confirmed_deals = []

    @user_received = current_user.received_deals
    if @user_received
      @user_received.each do |received_deal|
        if received_deal.status == 'pending'
          @received_deals << received_deal
        elsif received_deal.status == 'accepted'
        @accepted_deals << received_deal
        else
        end
      end
    end

    @user_requested = current_user.requested_deals
    if @user_requested
      @user_requested.each do |requested_deal|
        if requested_deal.status == 'pending'
          @sended_deals << requested_deal
        elsif requested_deal.status == 'accepted'
        @accepted_deals << requested_deal
        else
        end
      end
    end
  end

  def show
    @proposed_record = @deal.requester_record
    @asked_record = @deal.receiver_record
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end
end
