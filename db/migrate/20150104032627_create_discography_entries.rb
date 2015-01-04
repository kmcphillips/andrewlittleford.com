class CreateDiscographyEntries < ActiveRecord::Migration
  def change
    create_table :discography_entries do |t|
      t.string :title
      t.string :permalink
      t.text :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :image_fingerprint
      t.integer :sort_order, default: 0

      t.index :permalink
      t.timestamps null: false
    end
  end
end
