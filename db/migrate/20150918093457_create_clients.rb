class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :store_id, null: false
      t.string  :name
      t.decimal :balance, :precision => 8, :scale => 2, null: false, default: 0
      t.string  :phone, null: false
      t.string  :address

      t.timestamps null: false
    end
  end
end
