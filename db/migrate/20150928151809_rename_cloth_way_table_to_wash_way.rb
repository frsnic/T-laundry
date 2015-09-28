class RenameClothWayTableToWashWay < ActiveRecord::Migration
  def change
    rename_table :cloth_ways, :wash_ways
  end
end
