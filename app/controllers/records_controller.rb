class RecordsController < ApplicationController
  def index
    @records = Record.all
    @discover = []
    @records.each do |record|
      @discover << record if record.user != current_user && record.swappable && current_user.genres.include?(record.release.genre)
    end
  end
end
