class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string :image
      t.string :title
      t.string :artist
      t.string :label
      t.string :year
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
