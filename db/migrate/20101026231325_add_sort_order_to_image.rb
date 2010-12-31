class AddSortOrderToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :sort_order, :integer
    add_index :images, :sort_order
  end

  def self.down
    remove_column :images, :sort_order
  end
end
