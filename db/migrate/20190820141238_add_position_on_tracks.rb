class AddPositionOnTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :position, :string
  end
end
