module Deals
  module Mailers
    module Requester
      class Declined < ApplicationMailer
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
          "Votre demande d'échange auprès de #{@requester.username} a été refusée"
        end
      end
    end
  end
end
