module Deals
  module Reminders
    class Notify
      attr_reader :deal

      def initialize(deal)
        @deal = deal
      end

      def call
        return unless deal.none_validated_yet?
        return unless reminder_class

        send_reminder_to_both_parties
      end

      private

      def reminder_class
        @reminder_class ||= Schedule.new(deal).active_reminder
      end

      def send_reminder_to_both_parties
        reminder_class.with(deal: deal).send_to_requester.deliver_now
        reminder_class.with(deal: deal).send_to_receiver.deliver_now
      end
    end
  end
end
