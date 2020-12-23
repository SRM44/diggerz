module Deals
  module Mailers
    module Receiver
      class Created < ApplicationMailer
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
          "Vous avez reçu une demande d'échange de la part de #{@requester.username}"
        end
      end
    end
  end
end
