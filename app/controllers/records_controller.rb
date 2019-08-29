class RecordsController < ApplicationController
  def index
    @records = Record.all
    @discover_all = []
    @records.each do |record|
      if current_user.genres.empty?
        @discover_all << record if record.user != current_user && record.swappable
      else
        @discover_all << record if record.user != current_user && current_user.genres.include?(record.release.genre) && record.swappable
      end
      @discover = @discover_all.sample(100)
    end
  end

  def collection
  end

  def show
  end
end
