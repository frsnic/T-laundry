class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
