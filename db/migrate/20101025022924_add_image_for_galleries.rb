class AddImageForGalleries < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :label
      t.string :gallery
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at
      t.string :file_fingerprint

      t.timestamps
    end

    add_index :images, :gallery
  end

  def self.down
    drop_table :images
  end
end
