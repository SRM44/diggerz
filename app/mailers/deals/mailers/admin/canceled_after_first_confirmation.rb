module Deals
  module Mailers
    module Admin
      class CanceledAfterFirstConfirmation < ApplicationMailer
        def send_mail
          @deal = params[:deal]
          @requester, @receiver = @deal.requester, @deal.receiver

          mail(
            to:      ENV['ADMIN_EMAIL'],
            subject: subject,
          )
        end

        private

        def subject
          "C'est la MIERDA. #{@receiver.username} a confirmé un deal après que #{@requester.username} l'ait annulé 😱"
        end
      end
    end
  end
end
