class AddDiscogsColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :discogs_id, :string
    add_column :users, :token, :string
  end
end
