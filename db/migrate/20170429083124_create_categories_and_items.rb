class CreateCategoriesAndItems < ActiveRecord::Migration
  def change
    create_table :categorie_items do |t|
      t.integer :category_id
      t.string  :name
      t.timestamp
    end
    add_index :categorie_items, :category_id
  end
end
