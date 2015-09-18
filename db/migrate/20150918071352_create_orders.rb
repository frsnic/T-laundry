class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :store_id, null: false
      t.integer :client_id, null: false
      t.decimal :price, :precision => 8, :scale => 2, null: false, default: 0
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
