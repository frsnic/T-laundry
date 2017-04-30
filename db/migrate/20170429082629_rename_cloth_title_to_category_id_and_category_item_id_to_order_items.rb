class RenameClothTitleToCategoryIdAndCategoryItemIdToOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :cloth_title, :integer
    add_column :order_items, :category_id, :integer
    add_column :order_items, :category_item_id, :integer
  end
end
