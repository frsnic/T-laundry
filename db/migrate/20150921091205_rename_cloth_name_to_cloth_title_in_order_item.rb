class RenameClothNameToClothTitleInOrderItem < ActiveRecord::Migration
  def change
    rename_column :order_items, :cloth_name, :cloth_title
  end
end
