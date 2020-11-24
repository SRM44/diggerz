class RecordsController < ApplicationController
  skip_before_action :redirect_user_without_confirmed_email!, only: [:new, :create, :index, :show, :discover, :import_from_discogs]

  def discover
    @discover = Record.available_for_deals.
      joins(release: :genre).
      includes(release: :genre)
      # where.not(user: current_user) # To exclude records owned by user
  end

  def index
    @records = Record.available_for_deals.
      joins(release: :genre).
      includes(release: :genre)

    query = params.dig(:search, :query)
    if query.present?
      query_components = query.split(' ').map {|comp| "%#{comp}%"}

      columns_to_match_query_on = ['releases.title', 'releases.artist', 'releases.label']
      ilike_query = columns_to_match_query_on.map do |column|
        "#{column} ilike any ( array[:components] )"
      end.join(' OR ')

      @records = @records.where(ilike_query, components: query_components)
    end

    @location = params.dig(:search, :location)&.upcase || current_user.location

    if @location.present?
      @records = @records.joins(:user).where(users: {location: @location})
    end

    years = params.dig(:filters, :years)
    if years&.any?
      @records = @records.where(releases: { year: years })
    end

    genres = params.dig(:filters, :genres)
    if genres&.any?
      @records = @records.where(releases: { genres: { name: genres } })
    end

    # @records = @records.where.not(user: current_user) # To exclude records owned by user
    @records_count = @records.length
  end

  def collection
  end
end
