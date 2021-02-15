module Deals
  module Reminders
    First::DELAY_DURATION  = ENV.fetch('REMINDER_DELAY_IN_DAYS_FIRST').to_f.days
    Second::DELAY_DURATION = ENV.fetch('REMINDER_DELAY_IN_DAYS_SECOND').to_f.days
    Third::DELAY_DURATION  = ENV.fetch('REMINDER_DELAY_IN_DAYS_THIRD').to_f.days
    Last::DELAY_DURATION   = ENV.fetch('REMINDER_DELAY_IN_DAYS_LAST').to_f.days

    class Schedule
      attr_reader :deal

      def initialize(deal)
        @deal = deal
      end

      def active_reminder
        result = reminders_to_delays_mapping.find do |klass, delay|
          delay.ending_today_for?(deal)
        end

        result&.first&.constantize
      end

      private

      def reminders_to_delays_mapping
        {
          'Deals::Reminders::First'  => Deals::Reminders::Delay.new(First::DELAY_DURATION),
          'Deals::Reminders::Second' => Deals::Reminders::Delay.new(Second::DELAY_DURATION),
          'Deals::Reminders::Third'  => Deals::Reminders::Delay.new(Third::DELAY_DURATION),
          'Deals::Reminders::Last'   => Deals::Reminders::Delay.new(Last::DELAY_DURATION),
        }
      end
    end
  end
end
