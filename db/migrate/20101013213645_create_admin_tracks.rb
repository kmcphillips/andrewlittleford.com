class CreateAdminTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :title
      t.date :recorded_at
      t.text :description
      t.integer :sort_order
      t.boolean :active, :default => true
      t.string :mp3_file_name
      t.string :mp3_content_type
      t.integer :mp3_file_size
      t.datetime :mp3_updated_at

      t.timestamps
    end

    add_index :tracks, :active
    add_index :tracks, :sort_order
  end

  def self.down
    drop_table :tracks
  end
end
