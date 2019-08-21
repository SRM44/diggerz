class AddDiscogsIdToReleases < ActiveRecord::Migration[5.2]
  def change
     add_column :releases, :discogs_id, :string
  end
end
