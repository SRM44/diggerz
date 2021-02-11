module Deals
  module Mailers
    module Requester
      class Created < ApplicationMailer
        def send_mail
          @deal = params[:deal]
          @requester, @receiver = @deal.requester, @deal.receiver

          mail(
            to:      @requester.email,
            subject: subject,
          )
        end

        private

        def subject
          "Votre demande d'échange a bien été transmise à #{@receiver.username}"
        end
      end
    end
  end
end
