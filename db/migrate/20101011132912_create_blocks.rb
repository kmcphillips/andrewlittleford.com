class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.text :body
      t.string :label
      t.string :path

      t.timestamps
    end
    
    add_index :blocks, :label
  end

  def self.down
    drop_table :blocks
  end
end
