class AddSortOderToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :sort_order, :integer
    add_index :links, :sort_order
  end

  def self.down
    remove_column :links, :sort_order
  end
end
