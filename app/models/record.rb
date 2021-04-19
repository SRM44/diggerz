class Record < ApplicationRecord
  belongs_to :user
  belongs_to :release

  has_many :pictures, dependent: :destroy

  before_destroy :destroy_deals

  scope :swappable,          ->()     { where(swappable: true) }
  scope :not_swappable,      ->()     { where(swappable: false) }
  scope :available_for_user, ->(user) { where.not(user: user)  }

  scope :available_for_deals, ->() do
    accepted_deals_records_ids = Deal.
      accepted.
      pluck(:receiver_record_id, :requester_record_id).
      flatten.
      uniq

    swappable.where.not(id: accepted_deals_records_ids)
  end

  COLUMNS_TO_MATCH_WITH = ['releases.title', 'releases.artist', 'releases.label']

  scope :for_query, ->(query, columns_to_match_with: COLUMNS_TO_MATCH_WITH) do
    query_components = query.split(' ').map {|comp| "%#{comp}%"}

    ilike_query = columns_to_match_with.map do |column|
      "#{column} ilike any ( array[:components] )"
    end.join(' OR ')

    where(ilike_query, components: query_components)
  end

  def deals
    Deal.where(receiver_record: self).or(Deal.where(requester_record: self))
  end

  private

  def destroy_deals
    deals.destroy_all
  end
end
