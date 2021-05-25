module Deals
  module InProgress
    class ScheduleRemindersJob < ApplicationJob
      queue_as :reminders

      def perform
        deals_in_progress = Deal.in_progress

        deals_in_progress.each do |deal|
          Deals::Reminders::NotifyJob.perform_later(deal.id)
        end
      end
    end
  end
end
