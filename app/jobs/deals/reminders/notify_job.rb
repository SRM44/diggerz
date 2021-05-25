module Deals
  module Reminders
    class NotifyJob < ApplicationJob
      queue_as :reminders

      def perform(deal_id)
        deal = Deal.find(deal_id)
        Deals::Reminders::Notify.new(deal).call
      end
    end
  end
end
