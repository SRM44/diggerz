class RecordsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @records = Record.all
    @discover = @records.each do |record|
      return record if record.user != current_user && record.swappable && current_user.genres.include?(record.genre)
    end
  end
end
