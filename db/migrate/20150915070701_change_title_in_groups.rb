class ChangeTitleInGroups < ActiveRecord::Migration
  def change
    change_column :groups, :title, :string, null: false, :unique => true
  end
end
