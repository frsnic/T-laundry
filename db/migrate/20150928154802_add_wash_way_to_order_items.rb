class AddWashWayToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :wash_way, :string, after: :cloth_title
    change_column_null :order_items, :wash_way, false
  end
end
