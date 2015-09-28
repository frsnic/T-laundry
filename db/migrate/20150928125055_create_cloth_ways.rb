class CreateClothWays < ActiveRecord::Migration
  def change
    create_table :cloth_ways do |t|
      t.integer :cloth_id, null: false
      t.string  :title, null: false
      t.decimal :price, :precision => 8, :scale => 2, null: false, default: 0

      t.timestamps null: false
    end
    add_index :cloth_ways, [:cloth_id]
  end
end
