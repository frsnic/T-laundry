class AddGroupIdToStores < ActiveRecord::Migration
  def change
    add_column :stores, :group_id, :integer
    change_column_null :stores, :group_id, false
  end
end
