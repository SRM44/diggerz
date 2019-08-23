class RemoveTrackToRelease < ActiveRecord::Migration[5.2]
  def change
    remove_column :releases, :track, :string
  end
end
