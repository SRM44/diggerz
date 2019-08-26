class MydealsController < ApplicationController

  def index
    # TO DO
    # Afficher la liste de tous les deals (pendings, valide, passes)
    # 1- si pas de deals alors afficher placeholder
    # 2- si deals, afficher sur l'index en fonction du statut
    #    a) si recus en pending : afficher dans la categorie a valider
    @received_deals = current_user.received_deals
    #    b) si envoyes en pending : afficher dans la categorie en cours
    @accepted_deals = current_user.requested_deals.with_status(:pending)
    #    c) si echange confirme : afficher dans la categorie passe
    @confirmed_deals = current_user.requested_deals.with_status(:confirmed)
  end

  def show
  end
end
