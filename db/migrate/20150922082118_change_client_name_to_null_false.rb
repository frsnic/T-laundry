class ChangeClientNameToNullFalse < ActiveRecord::Migration
  def change
    change_column :clients, :name, :string, null: false
  end
end
