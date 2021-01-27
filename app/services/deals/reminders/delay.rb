module Deals
  module Reminders
    class Delay
      attr_reader :duration, :deal

      def initialize(duration)
        @duration = duration
      end

      def ending_today_for?(deal)
        @deal = deal

        date_brought_forward_by_delay_duration == today
      end

      private

      def date_brought_forward_by_delay_duration
        (deal.accepted_at + duration).beginning_of_day
      end

      def today
        Time.current.beginning_of_day
      end
    end
  end
end
