class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.string :title, null: false
      t.integer :group_id, null: false

      t.timestamps null: false
    end
  end
end
