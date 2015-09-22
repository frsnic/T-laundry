class AddPrecisionToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :precision, :integer, null: false, default: 2, after: :title
  end
end
