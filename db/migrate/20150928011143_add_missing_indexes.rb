class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :group_users, [:group_id, :user_id]
    add_index :group_users, :user_id
    add_index :group_users, :group_id
    add_index :store_users, [:store_id, :user_id]
    add_index :store_users, :user_id
    add_index :store_users, :store_id
    add_index :stores, :group_id
    add_index :order_items, :order_id
    add_index :orders, :store_id
    add_index :orders, :client_id
    add_index :orders, :user_id
    add_index :orders, [:store_id, :client_id]
    add_index :clients, :store_id
    add_index :cloths, :group_id
  end
end
