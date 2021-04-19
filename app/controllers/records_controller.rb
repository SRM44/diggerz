class RecordsController < ApplicationController
  skip_before_action :authenticate_user!,                     only: [:index, :discover]
  skip_before_action :redirect_user_without_confirmed_email!, only: [:index, :discover]

  def discover
    @discover = Record.
      available_for_deals.
      available_for_user(current_user).
      joins(release: :genre).
      includes(release: :genre)
  end

  def index
    @records = Record.
      available_for_deals.
      available_for_user(current_user).
      joins(release: :genre).
      includes(release: :genre)

    query = params.dig(:search, :query)
    if query.present?
      @records = @records.for_query(query)
    else 
      @records = @records.all
    end

    @location = params.dig(:search, :location)&.upcase || current_user&.location || User::Location.default
    if @location.present?
      @records = @records.joins(:user).where(users: { location: @location })
    end

    years = params.dig(:filters, :years)
    if years&.any?
      @records = @records.where(releases: { year: years })
    end

    genres = params.dig(:filters, :genres)
    if genres&.any?
      @records = @records.where(releases: { genres: { name: genres } })
    end

    @records_count = @records.length
    @user_records  = current_user&.records.presence || Record.none
  end
end
