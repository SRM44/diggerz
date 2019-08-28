class RemoveImageFromGenresTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :image, :string
  end
end
