class User
  class Location
    def self.default
      available.first
    end

    def self.available
      %w(
          Nantes
        )

      # %w(
      #     AIX-EN-PROVENCE
      #     AMIENS
      #     ANGERS
      #     BESANCONS
      #     BORDEAUX
      #     BREST
      #     CAEN
      #     CLERMONT-FERRAND
      #     DIJON
      #     GRENOBLE
      #     LE\ HAVRE
      #     LE\ MANS
      #     LILLE
      #     LIMOGES
      #     LYON
      #     MARSEILLE
      #     METZ
      #     MONTPELLIER
      #     MULHOUSE
      #     Nantes
      #     NICE
      #     NIMES
      #     ORLEANS
      #     PARIS
      #     PERPIGNAN
      #     REIMS
      #     RENNES
      #     ROUEN
      #     SAINT-ETIENNE
      #     STRASBOURG
      #     TOULON
      #     TOURS
      #     VILLEURBANNES
      #   )
    end
  end
end
