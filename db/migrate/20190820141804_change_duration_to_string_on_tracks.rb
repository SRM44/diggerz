class ChangeDurationToStringOnTracks < ActiveRecord::Migration[5.2]
  def change
    change_column :tracks, :duration, :string
  end
end
