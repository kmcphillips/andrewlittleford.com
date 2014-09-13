class RemoveGallery < ActiveRecord::Migration
  def change
    drop_table :galleries
    remove_column :images, :gallery_id
  end
end
