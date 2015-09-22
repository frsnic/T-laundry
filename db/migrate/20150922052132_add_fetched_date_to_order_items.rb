class AddFetchedDateToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :fetched_at, :datetime, after: :status
  end
end
