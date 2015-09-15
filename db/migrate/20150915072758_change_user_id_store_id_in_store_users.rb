class ChangeUserIdStoreIdInStoreUsers < ActiveRecord::Migration
  def change
    change_column :store_users, :user_id, :integer, null: false
    change_column :store_users, :store_id, :integer, null: false
  end
end
