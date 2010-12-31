class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :name
      t.string :path
      t.string :image
      t.integer :sort_order

      t.timestamps
    end

    add_index :galleries, :sort_order

    remove_column :images, :gallery
    add_column :images, :gallery_id, :integer
    add_index :images, :gallery_id
  end

  def self.down
    drop_table :galleries

    add_column :images, :gallery,:string
    remove_column :images, :gallery_id
  end
end
