class AddPhoneLandlineLocationToStores < ActiveRecord::Migration
  def change
    add_column :stores, :phone, :string
    add_column :stores, :landline, :string
    add_column :stores, :location, :string
  end
end
