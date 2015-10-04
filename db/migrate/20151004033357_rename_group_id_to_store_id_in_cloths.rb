class RenameGroupIdToStoreIdInCloths < ActiveRecord::Migration
  def change
    rename_column :cloths, :group_id, :store_id
  end
end
