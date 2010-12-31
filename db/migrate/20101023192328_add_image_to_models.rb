class AddImageToModels < ActiveRecord::Migration
  def self.up
    add_column :posts, :image_file_name, :string
    add_column :posts, :image_content_type, :string
    add_column :posts, :image_file_size, :integer
    add_column :posts, :image_updated_at, :datetime

    add_column :events, :image_file_name, :string
    add_column :events, :image_content_type, :string
    add_column :events, :image_file_size, :integer
    add_column :events, :image_updated_at, :datetime

    add_column :blocks, :image_file_name, :string
    add_column :blocks, :image_content_type, :string
    add_column :blocks, :image_file_size, :integer
    add_column :blocks, :image_updated_at, :datetime

    add_column :blocks, :accepts_image, :boolean, :default => false

  end

  def self.down
    remove_column :posts, :image_file_name
    remove_column :posts, :image_content_type
    remove_column :posts, :image_file_size
    remove_column :posts, :image_updated_at

    remove_column :events, :image_file_name
    remove_column :events, :image_content_type
    remove_column :events, :image_file_size
    remove_column :events, :image_updated_at

    remove_column :blocks, :image_file_name
    remove_column :blocks, :image_content_type
    remove_column :blocks, :image_file_size
    remove_column :blocks, :image_updated_at

    remove_column :blocks, :accepts_image
  end
end
