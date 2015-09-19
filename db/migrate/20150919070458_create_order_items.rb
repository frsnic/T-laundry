class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.string  :cloth_name, null: false
      t.integer :quantity, null: false, default: 1
      t.decimal :sum, :precision => 8, :scale => 2, null: false, default: 0

      t.timestamps null: false
    end
  end
end
