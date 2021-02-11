class Release
  class Year
    def self.available
      (1900..DateTime.now.year).map(&:to_s).reverse
    end
  end
end
