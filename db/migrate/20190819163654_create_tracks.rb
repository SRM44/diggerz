class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :duration
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
