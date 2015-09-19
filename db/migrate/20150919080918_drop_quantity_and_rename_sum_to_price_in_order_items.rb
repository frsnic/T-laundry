class DropQuantityAndRenameSumToPriceInOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :quantity, :decimal
    rename_column :order_items, :sum, :price
  end
end
