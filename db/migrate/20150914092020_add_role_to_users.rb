class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    change_column_null :users, :role, false
  end
end
