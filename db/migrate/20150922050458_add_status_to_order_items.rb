class AddStatusToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :status, :integer, null: false, default: 0, after: :price
  end
end
