class RecordsController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:new, :create, :index, :show, :import_from_discogs]
  
  def index
    @records = Record.all
    @discover = []
    @records.each do |record|
      if current_user.genres.empty?
        @discover << record if record.user != current_user && record.swappable
      else
        @discover << record if record.user != current_user && current_user.genres.include?(record.release.genre) && record.swappable
      end
      @discover
    end
  end

  def collection
  end

  def show
  end
end
