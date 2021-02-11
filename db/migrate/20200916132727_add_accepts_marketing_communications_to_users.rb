class AddAcceptsMarketingCommunicationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :accepts_marketing_communications, :boolean
  end
end
