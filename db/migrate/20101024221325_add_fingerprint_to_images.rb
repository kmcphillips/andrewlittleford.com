class AddFingerprintToImages < ActiveRecord::Migration
  def self.up
    add_column :posts, :image_fingerprint, :string
    add_column :events, :image_fingerprint, :string
    add_column :blocks, :image_fingerprint, :string
  end

  def self.down
    remove_column :posts, :image_fingerprint
    remove_column :events, :image_fingerprint
    remove_column :blocks, :image_fingerprint
  end
end
