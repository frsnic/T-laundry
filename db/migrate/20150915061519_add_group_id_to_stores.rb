class AddGroupIdToStores < ActiveRecord::Migration
  def change
    add_column :stores, :group_id, :integer, null: false
  end
end
