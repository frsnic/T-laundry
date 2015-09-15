class ChangeTitleInStores < ActiveRecord::Migration
  def change
    change_column :stores, :title, :string, null: false
  end
end
