class AddActiveToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :active, :boolean, :default => true
    add_index :images, :active
  end

  def self.down
    remove_column :active, :status
  end
end
