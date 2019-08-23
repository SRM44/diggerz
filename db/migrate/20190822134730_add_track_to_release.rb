class AddTrackToRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :track, :string
  end
end
