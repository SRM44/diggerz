module Deals
  module Mailers
    module Receiver
      class Accepted < ApplicationMailer
        def send_mail
          @deal = params[:deal]
          @requester, @receiver = @deal.requester, @deal.receiver

          mail(
            to:      @receiver.email,
            subject: subject,
          )
        end

        private

        def subject
          "C'est parti ! Nouvel échange en cours 🎉"
        end
      end
    end
  end
end
