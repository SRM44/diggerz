class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :condition
      t.boolean :swappable
      t.boolean :out
      t.references :user, foreign_key: true
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
