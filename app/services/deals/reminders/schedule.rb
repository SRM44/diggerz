module Deals
  module Reminders
    First::DELAY  = 2.days
    Second::DELAY = 4.days
    Third::DELAY  = 6.days
    Last::DELAY   = 7.days

    class Schedule
      attr_reader :deal

      def initialize(deal)
        @deal = deal
      end

      def reminder
        klass = reminders_to_delays_mapping.find do |klass, condition|
          condition.call(deal)
        end&.first

        klass&.constantize
      end

      private

      def reminders_to_delays_mapping
        {
          'Deals::Reminders::First'  => ->(deal) { (deal.accepted_at + First::DELAY).beginning_of_day  == beginning_of_today },
          'Deals::Reminders::Second' => ->(deal) { (deal.accepted_at + Second::DELAY).beginning_of_day == beginning_of_today },
          'Deals::Reminders::Third'  => ->(deal) { (deal.accepted_at + Third::DELAY).beginning_of_day  == beginning_of_today },
          'Deals::Reminders::Last'   => ->(deal) { (deal.accepted_at + Last::DELAY).beginning_of_day   == beginning_of_today },
        }
      end

      def beginning_of_today
        @beginning_of_today ||= Time.current.beginning_of_day
      end
    end
  end
end
